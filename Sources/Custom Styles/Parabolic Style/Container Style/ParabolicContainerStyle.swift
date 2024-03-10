import SwiftUI

public struct ParabolicContainerStyle: TabfinityContainerStyle {
    @Binding var size: CGSize
    @Binding var xAxis: CGFloat
    
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

