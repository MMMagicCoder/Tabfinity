import SwiftUI

struct TabfinityViewModifier<TabfinityItem: Tabbable>: ViewModifier {
    @EnvironmentObject private var selectionObject: TabfinitySelection<TabfinityItem>
    
    let item: TabfinityItem
    
    func body(content: Content) -> some View {
        Group {
            if self.item == self.selectionObject.selection {
                content
            } else {
                Color.clear
            }
        }
        .preference(key: TabfinityPreferenceKey.self, value: [self.item])
    }
}

extension View {
    /**
        A function that is used to associated view with the passed item.
        
        Use this function to associate view with the specific item
        of the `Tabfinity`.
        */
    public func tabfinityItem<TabfinityItem: Tabbable>(for item: TabfinityItem) -> some View {
        return self.modifier(TabfinityViewModifier(item: item))
    }
}
