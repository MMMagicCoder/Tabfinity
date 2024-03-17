import SwiftUI

/**
 A custom style for tabfinity container.
 
 Implement this style using `TabfinityContainer(style:)` function.
 
 - Parameters:
  - size: The size of each tabfinity item. When the number of tabfinity items changes, the size automatically adapts to fit.
  - xAxis: It is used to determine the placement position of the parabolic shape.
 */

public struct ParabolicContainerStyle: TabfinityContainerStyle {
    @Binding var size: CGSize
    @Binding var xAxis: CGFloat
    
    public init(size: Binding<CGSize>, xAxis: Binding<CGFloat>) {
        self._size = size
        self._xAxis = xAxis
    }
    
    public func tabfinityContainer(with geometry: GeometryProxy, container: @escaping () -> AnyView) -> some View {
        container()
            .frame(height: 20)
            .padding(.vertical)
            .background(
                Color.white
                    .cornerRadius(12)
                    .clipShape(
                        Parabolic(size: size, xAxis: xAxis)))
            .padding(.horizontal)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
    }
}

