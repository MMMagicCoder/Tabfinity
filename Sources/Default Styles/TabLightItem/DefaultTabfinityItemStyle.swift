import SwiftUI

/**
 Default implementation of the `TabfinityItemStyle` protocol.
 
 This style replicates the default appearance of the iOS `UITabBar`.
 It is used by default in the `TabBar` component.
 */
public struct DefaultTabfinityItemStyle: TabfinityItemStyle {
    public func tabfinityItem(icon: String, selectedIcon: String, title: String, color: Color, isSelected: Bool) -> some View {
        VStack(spacing: 5.0) {
            Image(systemName: icon)
                .renderingMode(.template)
            
            Text(title)
                .font(.system(size: 10.0, weight: .medium))
        }
        .foregroundColor(isSelected ? .accentColor : .gray)
    }
}
