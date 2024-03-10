//
//  ParabolicShape.swift
//  TabBar
//
//  Created by mohammadmahdi moayeri on 3/8/24.
//

import SwiftUI

public struct Parabolic: Shape {
    var size: CGSize
    var xAxis: CGFloat
    
    public var animatableData: CGFloat {
        get { return xAxis }
        set { xAxis = newValue }
    }
    
    public func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            
            path.move(to: CGPoint(x: center - (size.width / 2), y: 0))
            
            let to1 = CGPoint(x: center, y: size.height * 1.5)
            let control1 = CGPoint(x: center - (size.width / 4), y: 0)
            let control2 = CGPoint(x: center - (size.width / 4), y: size.height * 1.5)
            
            let to2 = CGPoint(x: center + (size.width / 2), y: 0)
            let control3 = CGPoint(x: center + (size.width / 4), y: size.height * 1.5)
            let control4 = CGPoint(x: center + (size.width / 4), y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}

struct ParabolicShape: View {
    var body: some View {
        ZStack {
            Parabolic(size: CGSize(width: 300, height: 50), xAxis: 150)
                .frame(width: 300, height: 80)
        }
    }
}

#Preview {
    ParabolicShape()
}
