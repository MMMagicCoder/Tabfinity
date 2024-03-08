import SwiftUI

struct TabRectangleGeometrySizePreferencedKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

extension View {
    func updateTabGeoSize(_ size: CGSize) -> some View {
        preference(key: TabRectangleGeometrySizePreferencedKey.self, value: size)
    }
}

class TabfinityItemSize: ObservableObject {
    @Published var size: CGSize = .zero
}
