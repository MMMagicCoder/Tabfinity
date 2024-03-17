import SwiftUI

/**
 A custom style for tabfinity container.
 
 Implement this style using `TabfinityContainer(style:)` function.
 */
public struct LampContainerStyle: TabfinityContainerStyle {
    
    public init() { }
    
    public func tabfinityContainer(with geometry: GeometryProxy, container: @escaping () -> AnyView) -> some View {
        container()
            .frame(height: 65)
            .padding(6)
            .background(Color.white.ignoresSafeArea(edges: .bottom))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0.0, y: 5)
            .padding(.horizontal)
            .padding(.bottom, 30)
    }
}
