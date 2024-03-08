import SwiftUI

/**
 Type eraser which is used to represent
 any style of `TabfinityContainer` .
 
 Use this type only when there is a necessity
 to represent any container style.
 */
public struct AnyTabfinityContainerStyle: TabfinityContainerStyle {
    private let _makeTabfinityContainer: (GeometryProxy, @escaping () -> AnyView) -> AnyView
    
    public init<ContainerStyle: TabfinityContainerStyle>(containerStyle: ContainerStyle) {
        self._makeTabfinityContainer = containerStyle.tabfinityContainerErased
    }
    
    public func tabfinityContainer(with geometry: GeometryProxy, container: @escaping () -> AnyView) -> some View {
        return self._makeTabfinityContainer(geometry, container)
    }
}
