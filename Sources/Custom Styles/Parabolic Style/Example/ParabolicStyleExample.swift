import SwiftUI

struct ParabolicStyleExample: View {
    @EnvironmentObject private var item: TabfinityItemSize
    @Namespace private var namespace
    
    @State private var selection: Item = .home
    @State private var localSelection: Item = .home
    
    var body: some View {
        Tabfinity(selection: $selection) {
            Color.red.ignoresSafeArea(.all)
                .tabfinityItem(for: Item.home)
            
            Color.blue.ignoresSafeArea(.all)
                .tabfinityItem(for: Item.favorites)
            
            Color.green.ignoresSafeArea(.all)
                .tabfinityItem(for: Item.profile)
        }
        .tabfinityContainer(style: ParabolicContainerStyle(size: $item.size,xAxis: $item.axis))
        .tabfinityItem(style: ParabolicItemStyle(localSelection: $localSelection, size: $item.size))
        .onChange(of: selection, perform: handleAnimation)
    }
}

#Preview {
    ParabolicStyleExample()
        .environmentObject(TabfinityItemSize())
}


extension ParabolicStyleExample {
    private func handleAnimation(_ newValue: Item) {
        withAnimation(.easeInOut) {
            localSelection = selection
        }
    }
}
