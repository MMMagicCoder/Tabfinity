import SwiftUI

struct MountainStyleExample: View {
    @EnvironmentObject private var item: TabfinityItemSize
    @Namespace private var namespace
    
    @State var animation: Animation = .interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)
    @State private var selection: Item = .home
    @State private var localSelection: Item = .home
    
    var body: some View {
        Tabfinity(selection: $selection, animation: $animation) {
            Color.red.ignoresSafeArea(.all)
                .tabfinityItem(for: Item.home)
            
            Color.blue.ignoresSafeArea(.all)
                .tabfinityItem(for: Item.favorites)
            
            Color.green.ignoresSafeArea(.all)
                .tabfinityItem(for: Item.profile)
        }
        .tabfinityContainer(style: MountainContainerStyle(size: $item.size, xAxis: $item.axis))
        .tabfinityItem(style: MountainItemStyle(localSelection: $localSelection, size: $item.size))
        .onChange(of: selection, perform: handleAnimation)
    }
}

#Preview {
    MountainStyleExample()
        .environmentObject(TabfinityItemSize())
}

extension MountainStyleExample {
    private func handleAnimation(_ newValue: Item) {
        withAnimation(.easeInOut) {
            localSelection = selection
        }
    }
}
