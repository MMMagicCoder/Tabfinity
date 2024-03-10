import SwiftUI

/**
 A custom style for tabfinity items with a parabolic-style indicator to distinguish the selected item.
 
 Implement this style using `TabfinityItem(style:)` function.
 
 - Parameters:
    - localSelection: A variable conforming to the `Tabbable` protocol, used for animating and moving the parabolic shape to the selected item.
    - size: The size of each tabfinity item. When the number of tabfinity items changes, the size automatically adapts to fit.
 */

struct ParabolicItemStyle<TabfinityItem: Tabbable>: TabfinityItemStyle {
    @Binding var localSelection: TabfinityItem
    @Binding var size: CGSize
    
    func tabfinityItem(icon: String, title: String, color: Color, isSelected: Bool) -> some View {
        GeometryReader { geo in
            VStack {
                Image(systemName: icon)
                    .font(size.width > 100 ? .headline : .subheadline)
                    .padding(TabfinityItem.isItemSelected(
                        selector: localSelection,
                        icon: icon,
                        title: title,
                        color: color) ? 15 : 0)
                    .background(Color.white.opacity(TabfinityItem.isItemSelected(
                        selector: localSelection,
                        icon: icon,
                        title: title,
                        color: color) ? 1 : 0))
                    .clipShape(Circle())
                    .offset(
                            y: TabfinityItem.isItemSelected(
                        selector: localSelection,
                        icon: icon,
                        title: title,
                        color: color) ? -50 : 0)
            }
            .foregroundStyle(TabfinityItem.isItemSelected(
                selector: localSelection,
                icon: icon,
                title: title,
                color: color) ? color : .gray)
            .frame(maxWidth: .infinity)
        }
    }
}
