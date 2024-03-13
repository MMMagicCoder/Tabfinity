import SwiftUI

/**
 A custom style for tabfinity items with a mountain-style indicator to distinguish the selected item.
 
 Implement this style using `TabfinityItem(style:)` function.
 
 - Parameters:
    - localSelection: A variable conforming to the `Finitable` protocol, used for animating and moving the mountain shape to the selected item.
    - size: The size of each tabfinity item. When the number of tabfinity items changes, the size automatically adapts to fit.
 */
public struct MountainItemStyle<TabfinityItem: Finitable>: TabfinityItemStyle {
    @Binding var localSelection: TabfinityItem
    @Binding var size: CGSize
    
    public func tabfinityItem(icon: String, title: String, color: Color, isSelected: Bool) -> some View {
        GeometryReader { geo in
            VStack {
                Image(systemName: isSelected ? icon + ".fill" : icon)
                    .font(size.width > 100 ? .headline : .subheadline)
                    .offset(
                            y: TabfinityItem.isItemSelected(
                        selector: localSelection,
                        icon: icon,
                        title: title,
                        color: color) ? -8 : 0)
            }
            .foregroundColor(TabfinityItem.isItemSelected(
                selector: localSelection,
                icon: icon,
                title: title,
                color: color) ? color : .gray)
            .frame(maxWidth: .infinity)
        }
    }
}
