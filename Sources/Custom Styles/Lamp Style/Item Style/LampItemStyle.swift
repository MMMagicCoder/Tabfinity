import SwiftUI

/**
 A custom style for tabfinity items with a lamp-style indicator to highlight the selected item.
 
 Implement this style using `TabfinityItem(style:)` function.
 
 - Parameters:
    - moveLamp: A variable conforming to the `Tabbable` protocol, used for animating and moving the lamp shape to the selected item.
    - showLight: A variable conforming to the `Tabbable` protocol, used for animating and moving the light shape to the selected item with a delay.
    - size: The size of each tabfinity item. When the number of tabfinity items changes, the size automatically adapts to fit.
    - namespace: A namespace used to create fantastic moving animations for the lamp shape.
 */

public struct LampItemStyle<TabfinityItem: Tabbable>: TabfinityItemStyle {
    @Binding var moveLamp: TabfinityItem
    @Binding var showLight: TabfinityItem
    @Binding var size: CGSize
    var namespace: Namespace.ID
    
    public func tabfinityItem(icon: String, title: String, color: Color, isSelected: Bool) -> some View {
        ZStack {
            if TabfinityItem.isItemSelected(
                selector: moveLamp,
                icon: icon,
                title: title,
                color: color) {
                VStack {
                    Lamp()
                        .fill(Color(red: 0.2, green: 0.2, blue: 0.2))
                        .frame(width: size.width / 2.5 , height: 6, alignment: .top)
                        .matchedGeometryEffect(id: "lamp", in: namespace)
                    
                    Spacer()
                }
            }
            
            VStack(spacing: 3) {
                Image(systemName: icon)
                    .font(.subheadline)
                    .padding(.top, 3)
                
                Text(title)
                    .font(.system(size: 10, weight: .semibold, design: .rounded))
                    .padding(.top, 3)
            }
            .foregroundStyle(TabfinityItem.isItemSelected(
                selector: showLight,
                icon: icon,
                title: title,
                color: color) ? color : .gray)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(
                Light()
                    .fill(Color.yellow.opacity(0.4))
                    .frame(width: size.width / 1.5)
                    .opacity(TabfinityItem.isItemSelected(
                        selector: showLight,
                        icon: icon,
                        title: title,
                        color: color) ? 1.0 : 0.0)
                    .padding(.top, 3)
            )
        }
    }
}




