//
//  File.swift
//  
//
//  Created by mohammadmahdi moayeri on 2/14/24.
//

import SwiftUI

struct LightShape: View {
    @State var length: CGFloat = 100
    var body: some View {
        VStack(spacing: 3) {
            Lamp()
                    .frame(width: 50, height: 10, alignment: .center)
            Light()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundStyle(Color.yellow.opacity(0.3))
        }
    }
}

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
