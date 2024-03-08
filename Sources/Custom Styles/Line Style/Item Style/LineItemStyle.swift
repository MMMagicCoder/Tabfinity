import SwiftUI

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
