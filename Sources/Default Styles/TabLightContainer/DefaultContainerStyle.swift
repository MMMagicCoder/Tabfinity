import SwiftUI

/**
 Default implementation of the `TabfinityContainerStyle` protocol.
 
 This style replicates the default appearance of the iOS `UITabBar`.
 It is used by default in the `TabBar` component.
 */

public struct DefaultContainerStyle: TabfinityContainerStyle {
    public func tabfinityContainer(with geometry: GeometryProxy, container: @escaping () -> AnyView) -> some View {
        VStack(spacing: 0.0) {
            Divider()
            
            VStack {
                container()
                    .frame(height: 50.0)
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
            }
            .background(
                Color(
                    red:   249 / 255,
                    green: 249 / 255,
                    blue:  249 / 255,
                    opacity: 0.94
                )
            )
            .frame(height: 50.0 + geometry.safeAreaInsets.bottom)
        }
    }
}
