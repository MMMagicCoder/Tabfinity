import SwiftUI

struct TabLight: View {
    let tabs: [TabLightItem]
    @Binding var selection: TabLightItem
    @State private var size: CGSize = .zero
    @Namespace private var namespace
    @State var localSelection: TabLightItem
    @State var showLight: TabLightItem
    @State var timer: Timer?
    
    var body: some View {
        tabLightView
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

struct TabLight_Previews: PreviewProvider {
    static let tabs: [TabLightItem] = [
        .home, .favorites, .profile
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            
            TabLight(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!, showLight: tabs.first!)
        }
    }
}


extension TabLight{
    private func tabView(tab: TabLightItem) -> some View {
            ZStack {
                VStack(spacing: 0) {
                    if localSelection == tab {
                        Lamp()
                            .fill(Color(red: 0.2, green: 0.2, blue: 0.2))
                            .frame(width: size.width / 2.5, height: 6)
                            .matchedGeometryEffect(id: "lamp", in: namespace)
                    }
                    
                        VStack(spacing: 3) {
                            Image(systemName: tab.iconName)
                                .font(.subheadline)
                                .padding(.top, 3)
                            
                            Text(tab.title)
                                .font(.system(size: 10, weight: .semibold, design: .rounded))
                                .padding(.top, 3)
                                .opacity(showLight == tab ? 1.0 : 0.0)
                            
                        }
                        .foregroundStyle(showLight == tab ? tab.color : .gray)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background(
                        Light()
                            .fill(Color.yellow.opacity(0.4))
                            .frame(width: size.width / 1.5)
                            .opacity(showLight == tab ? 1.0 : 0.0)
                            .padding(.top, 3)
                        )
                    }
            }
    }
    
    private var tabLightView: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                GeometryReader { geo in
                    tabView(tab: tab)
                        .updateTabGeoSize(geo.size)
                        .onTapGesture {
                            switchToTab(tab: tab)
                            startTimer(tab: tab)
                    }
                }
            }
        }
        .frame(height: 65)
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0.0, y: 5)
        .padding(.horizontal)
        .onPreferenceChange(TabRectangleGeometrySizePreferencedKey.self, perform: { value in
            size = value
        })
    }
    
    private func switchToTab(tab: TabLightItem) {
        selection = tab
    }
    
    func startTimer(tab: TabLightItem) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            withAnimation(.easeOut) {
                showLight = tab
            }
        }
    }
}

extension View {
    func updateTabGeoSize(_ size: CGSize) -> some View {
        preference(key: TabRectangleGeometrySizePreferencedKey.self, value: size)
    }
}


struct TabRectangleGeometrySizePreferencedKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}
