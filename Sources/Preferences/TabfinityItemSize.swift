import SwiftUI

struct TabfinityItemSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}


extension View {
    func updateTabGeoSize(_ size: CGSize) -> some View {
        preference(key: TabfinityItemSizePreferenceKey.self, value: size)
    }
    
//    func getGeoProxy(_ geo: GeometryProxy) -> GeometryProxy {
//        
//    }
}

class TabfinityItemSize: ObservableObject {
    @Published var size: CGSize = .zero
    @Published var axis: CGFloat = 0.0
}
