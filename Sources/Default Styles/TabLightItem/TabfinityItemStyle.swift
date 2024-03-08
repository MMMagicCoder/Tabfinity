import SwiftUI

/**
 A type that represents tabfinityItem style.
 
 This type is utilized by `Tabfinity` to apply custom styling to its items.
  Customize the appearance of the item by passing your custom style to `TabfinityItem`
  using the `tabfinityItem(style:)` function.
 */
public protocol TabfinityItemStyle {
    associatedtype Content : View
    
    func tabfinityItem(icon: String, title: String, color: Color, isSelected: Bool) -> Content
    func tabfinityItem(icon: String, selectedIcon: String, title: String, color: Color, isSelected: Bool) -> Content
}

extension TabfinityItemStyle {
    public func tabfinityItem(icon: String, title: String, color: Color, isSelected: Bool) -> Content {
        return self.tabfinityItem(icon: icon, selectedIcon: icon, title: title ,color: color, isSelected: isSelected)
    }
    
    public func tabfinityItem(icon: String, selectedIcon: String, title: String, color: Color, isSelected: Bool) -> Content {
        return self.tabfinityItem(icon: icon, title: title, color: color, isSelected: isSelected)
    }

    func tabfinityItemErased(icon: String, selectedIcon: String, title: String, color: Color, isSelected: Bool) -> AnyView {
        return .init(self.tabfinityItem(icon: icon, selectedIcon: selectedIcon, title: title ,color: color, isSelected: isSelected))
    }
}
