import SwiftUI

/**
 A mountain shape aligned inside the frame of the view containing it.
 */
public struct Mountain: Shape {
    var size: CGSize
    var xAxis: CGFloat
    
    public var animatableData: CGFloat {
        get { return xAxis }
        set { xAxis = newValue }
    }
    
    public func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let mid = xAxis
            
            path.move(to: CGPoint(x: mid - 40, y: rect.height))
            
            let to1 = CGPoint(x: mid, y: rect.height - 20)
            let control1 = CGPoint(x: mid - 15, y: rect.height)
            let control2 = CGPoint(x: mid - 15, y: rect.height - 20)
            
            let to2 = CGPoint(x: mid + 40, y: rect.height)
            let control3 = CGPoint(x: mid + 15, y: rect.height - 20)
            let control4 = CGPoint(x: mid + 15, y: rect.height)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
            
            path.move(to: CGPoint(x: mid, y: rect.height))
            
            let center = CGPoint(x: mid, y: rect.height - 5)
                       let radius: CGFloat = 5
                       let startAngle: Angle = .degrees(0)
                       let endAngle: Angle = .degrees(360)
                       let clockwise = false
            
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        }
    }
}


struct MountainShape_Preview: PreviewProvider {
    static var previews: some View {
        Mountain(size: CGSize(width: 300, height: 50), xAxis: 150)
            .frame(width: 300, height: 80)
    }
}
