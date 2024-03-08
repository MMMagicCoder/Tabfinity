import SwiftUI

/**
 Type eraser which is used to represent
 any style of `TabfinityItem` .
 
 Use this type only when there is a necessity
 to represent any item style.
 */
public struct AnyTabfinityItemStyle: TabfinityItemStyle {
    private let _makeTabfinityItem: (String, String, String, Color, Bool) -> AnyView
    
    public init<TabfinityItem: TabfinityItemStyle>(itemStyle: TabfinityItem) {
        self._makeTabfinityItem = itemStyle.tabfinityItemErased(icon:selectedIcon:title:color:isSelected:)
    }
    
    public func tabfinityItem(icon: String, selectedIcon: String, title: String, color: Color, isSelected: Bool) -> some View {
        return self._makeTabfinityItem(icon, selectedIcon, title, color, isSelected)
    }
}
