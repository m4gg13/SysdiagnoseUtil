//
//  NodeView.swift
//  SysdiagnoseUtil
//
//  Created by Maggie Zirnhelt on 3/31/24.
//

import SwiftUI

struct NodeView: View {
    var body: some View {
        GeometryReader { geometry in

            let spacing = 50.0

            Path { path in

                let width = min(geometry.size.width, geometry.size.height)

                let height = width * 0.75

                let middle = width * 0.5
                let topWidth = width * 0.5

                let topHeight = height * 0.488

                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))

                path.addLines([
                    CGPoint(x: spacing, y: spacing),
                    CGPoint(x: width + spacing, y: spacing),
                    CGPoint(x: width + spacing, y: height + spacing),
                    CGPoint(x: spacing, y: height + spacing),
                ])
            }
            .fill(.white)

            Text("a thing").colorInvert().position(x: spacing + 70.0, y: spacing + 20.0)
        }
    }
}

struct Header1Node {
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }

    static let adjustment: CGFloat = 0.085

    static let segments = [

        Segment(

            line:    CGPoint(x: 0.60, y: 0.05),

            curve:   CGPoint(x: 0.40, y: 0.05),

            control: CGPoint(x: 0.50, y: 0.00)

        ),

        Segment(

            line:    CGPoint(x: 0.05, y: 0.20 + adjustment),

            curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),

            control: CGPoint(x: 0.00, y: 0.25 + adjustment)

        ),

        //            Segment(
        //
        //                line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
        //
        //                curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
        //
        //                control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        //
        //            ),

        Segment(

            line:    CGPoint(x: 0.40, y: 0.55),

            curve:   CGPoint(x: 0.60, y: 0.55),

            control: CGPoint(x: 0.50, y: 0.60)

        ),

        //            Segment(
        //
        //                line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
        //
        //                curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
        //
        //                control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        //
        //            ),

        Segment(

            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),

            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),

            control: CGPoint(x: 1.00, y: 0.25 + adjustment)

        )

    ]
}

#Preview {

    NodeView()

}
