import SwiftUI

struct Light: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        path.move(to: CGPoint(x: width / 4, y: 0))
        
        path.addLine(to: CGPoint(x: width - width / 4, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width / 4, y: 0))
        path.closeSubpath()
        
        return path
    }
}

struct Lamp: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.size.width
        let h = rect.size.height
        
        path.move(to: CGPoint(x: 0, y: h))
        path.addCurve(to: CGPoint(x: 4 * h, y: 0), control1: CGPoint(x: 0, y: 0), control2: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: w - 4 * h, y: 0))
        path.addCurve(to: CGPoint(x: w, y: h), control1: CGPoint(x: w, y: 0), control2: CGPoint(x: w, y: 0))
        path.addLine(to: CGPoint(x: w, y: h))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.addLine(to: CGPoint(x: 0, y: h / 2))
        
        path.move(to: CGPoint(x: w / 2 + h / 8, y: 0))
        path.addLine(to: CGPoint(x: w / 2 + h / 8, y: -w / 6 ))
        path.addLine(to: CGPoint(x: w / 2 - h / 8, y: -w / 6 ))
        path.addLine(to: CGPoint(x: w / 2 - h / 8, y: 0))
        path.closeSubpath()
               
        return path
    }
}
