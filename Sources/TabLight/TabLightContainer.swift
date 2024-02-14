import SwiftUI

public struct TabLightContainer<Content: View>: View {
    @Binding var selection: TabLightItem
    let content: Content
    @State private var tabs: [TabLightItem] = []
    
    init(selection: Binding<TabLightItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            TabLight(tabs: tabs, selection: $selection, localSelection: selection, showLight: selection)
        }
        .onPreferenceChange(TabLightPreferencedKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct ThirdCustomTabBarContainerView_Previews: PreviewProvider {
    static let tabs: [TabLightItem] = [
        .home, .favorites, .profile
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            
            TabLightContainer(selection: .constant(tabs.first!)) {
                Color.red
            }
        }
    }
}
