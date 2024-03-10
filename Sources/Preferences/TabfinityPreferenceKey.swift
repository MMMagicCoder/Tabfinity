import SwiftUI

struct TabfinityPreferenceKey<TabfinityItem: Finitable>: PreferenceKey {
    static var defaultValue: [TabfinityItem] {
        return .init()
    }
    
    static func reduce(value: inout [TabfinityItem], nextValue: () -> [TabfinityItem]) {
        value.append(contentsOf: nextValue())
    }
}
