import SwiftUI

struct LampStyleExample: View {
    
    private enum Item: Int, Tabbable {
        case home, favorites, profile
        
        var icon: String {
            switch self {
            case .home: return "house"
            case .favorites: return "heart"
            case .profile: return "person"
            }
        }
        
        var title: String {
            switch self {
            case .home: return "Home"
            case .favorites: return "Favorites"
            case .profile: return "Profile"
            }
        }
        
        var color: Color {
            switch self {
            case .home: return Color.red
            case .favorites: return Color.blue
            case .profile: return Color.green
            }
        }
    }
    
    @EnvironmentObject private var item: TabfinityItemSize
    @Namespace private var namespace
    
    @State private var selection: Item = .home
    @State private var showLight: Item = .home
    @State private var moveLamp: Item = .home
    
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
        .tabfinityItem(style: LampItemStyle(
            moveLamp: $moveLamp,
            showLight: $showLight,
            size: $item.size,
            namespace: namespace))
        .onChange(of: selection, perform: handleAnimations)
    }
}

#Preview {
    LampStyleExample()
        .environmentObject(TabfinityItemSize())
}

extension LampStyleExample {
    private func handleAnimations(_ newValue: Item) {
        withAnimation(.easeInOut) {
            moveLamp = selection
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            withAnimation(.easeInOut) {
                showLight = selection
            }
        }
    }
}


