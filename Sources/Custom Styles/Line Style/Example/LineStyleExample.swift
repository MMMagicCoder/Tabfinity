import SwiftUI

struct LineStyleExample: View {
    @EnvironmentObject private var item: TabfinityItemSize
    @Namespace private var namespace
    
    @State private var selection: Item = .home
    @State private var localSelection: Item = .home
    
    var body: some View {
        Tabfinity(selection: $selection) {
            Text("First Tab")
                .tabfinityItem(for: Item.home)
            
            Text("Second Tab")
                .tabfinityItem(for: Item.favorites)
            
            Text("Third Tab")
                .tabfinityItem(for: Item.profile)
        }
        .tabfinityContainer(style: LampContainerStyle())
        .tabfinityItem(style: LineItemStyle(localSelection: $localSelection, size: $item.size, namespace: namespace))
        .onChange(of: selection, perform: handleAnimation)
    }
}

#Preview {
    LineStyleExample()
        .environmentObject(TabfinityItemSize())
}

extension LineStyleExample {
    private func handleAnimation(_ newValue: Item) {
        withAnimation(.easeInOut) {
            localSelection = selection
        }
    }
}
