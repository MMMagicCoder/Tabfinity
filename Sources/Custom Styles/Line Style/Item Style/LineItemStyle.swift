import SwiftUI

/**
 A custom style for tabfinity items with a line-style indicator to distinguish the selected item.
 
 Implement this style using `TabfinityItem(style:)` function.
 
 - Note: Use this item style with `LampContainerStyle()` as it's container style is a good choice. 
 
 - Parameters:
    - localSelection: A variable conforming to the `Tabbable` protocol, used for animating and moving the line shape to the selected item.
    - size: The size of each tabfinity item. When the number of tabfinity items changes, the size automatically adapts to fit.
    - namespace: A namespace used to create fantastic moving animations for the line shape.
 */

public struct LineItemStyle<TabfinityItem: Tabbable>: TabfinityItemStyle {
    @Binding var localSelection: TabfinityItem
    @Binding var size: CGSize
    var namespace: Namespace.ID
    
    public func tabfinityItem(icon: String, title: String, color: Color, isSelected: Bool) -> some View {
        VStack {
            Image(systemName: icon)
                .font(.subheadline)
            
            Text(title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
                .padding(.top, 3)
                .opacity(TabfinityItem.isItemSelected(
                    selector: localSelection,
                    icon: icon,
                    title: title,
                    color: color) ? 1.0 : 0)
        }
        .foregroundStyle(TabfinityItem.isItemSelected(
            selector: localSelection,
            icon: icon,
            title: title,
            color: color) ? color : .gray)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(
                VStack {
                    if TabfinityItem.isItemSelected(
                        selector: localSelection,
                        icon: icon,
                        title: title,
                        color: color) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(color)
                            .frame(width: size.width / 3, height: 2)
                            .matchedGeometryEffect(id: "top_rectangle", in: namespace)
                        
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
        )
    }
}
