import SwiftUI

/**
 A protocol representing an item that can be displayed within the `TabLight` component.
 
 Use this protocol to define the properties required for each tab item in the `TabLight` component, such as its icon, title, and color.
 
 - Note: Conforming types must provide implementations for the `icon`, `title`, and `color` properties.
 - Note: The `selectedIcon` property is optional, defaulting to the value of the `icon` property if not explicitly implemented.
 */

public protocol Tabbable: Hashable {
    /// The name of the icon associated with the tab item.
    var icon: String { get }
    
    /// The title displayed for the tab item.
    var title: String { get }
    
    /// The color used to represent the tab item.
    var color: Color { get }
    
    /**
     An optional property representing the name of the icon to be displayed when the tab item is selected.
     
     If not explicitly implemented, defaults to the value of the `icon` property.
     
     - Note: Implementing this property allows customization of the icon displayed when the tab item is selected.
     */
    var selectedIcon: String { get }
}

public extension Tabbable {
    var selectedIcon: String {
        return self.icon
    }
    
    /**
     A function used to make the selected item animatable. This function can be utilized within custom Tabfinity items that you create.

    - Example:
        Here's how you can create an opacity animation to show the title when the user selects the corresponding item:
     - Note: Ensure to update the localSelection value within the view where you apply this item style, using the `withAnimation()` function to trigger smooth animations.
     ```swift
     // Example usage:
     public struct LineItemStyle<TabfinityItem: Tabbable>: TabfinityItemStyle {
         @Binding var localSelection: TabfinityItem
         public func tabfinityItem(icon: String, title: String, color: Color, isSelected: Bool) -> some View {
             VStack {
                 Image(systemName: icon)
                     .font(.subheadline)
                 
                 Text(title)
                     .font(.system(size: 10, weight: .semibold, design: .rounded))
                     .padding(.top, 3)
                     .opacity(TabfinityItem.isItemSelected(selector: localSelection, icon: icon, title: title, color: color) ? 1.0 : 0)
             }
         }
     }
     */
    static func isItemSelected(selector: Self, icon: String, title: String, color: Color) -> Bool {
        return selector.icon == icon && selector.title == title && selector.color == color
    }
}

