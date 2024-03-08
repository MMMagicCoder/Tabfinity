import SwiftUI

/**
 A type that represents tabfinityContainer style.
 
 This type is utilized by `Tabfinity` to apply custom styling to its container.
  Customize the appearance of the container by passing your custom style to `TabfinityContainer`
  using the `tabfinityContainer(style:)` function.
 */

public protocol TabfinityContainerStyle {
    associatedtype Content: View
    
    func tabfinityContainer(with geometry: GeometryProxy, container: @escaping () -> AnyView) -> Content
}

extension TabfinityContainerStyle {
    func tabfinityContainerErased(with geometry: GeometryProxy, container: @escaping () -> AnyView) -> AnyView {
        return .init(self.tabfinityContainer(with: geometry, container: container))
    }
}
