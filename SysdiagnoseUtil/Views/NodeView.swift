//
//  NodeView.swift
//  SysdiagnoseUtil
//
//  Created by Maggie Zirnhelt on 3/31/24.
//

import SwiftUI

struct NodeView: View {
    var body: some View {

        let width = 10.0
        let height = 10.0

        Path { path in
            path.move(
                to: CGPoint(
                    x: 100,
                    y: 100
                )
            )

            Header1Node.segments.forEach { segment in
                path.addLine(
                    to: CGPoint(
                        x: width * segment.line.x + 100,
                        y: height * segment.line.y + 100
                    )
                )
            }
        }
        .fill(.black)
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

        Segment(

            line:    CGPoint(x: 0.00, y: 0.70 - adjustment),

            curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),

            control: CGPoint(x: 0.00, y: 0.75 - adjustment)

        ),

        Segment(

            line:    CGPoint(x: 0.40, y: 0.95),

            curve:   CGPoint(x: 0.60, y: 0.95),

            control: CGPoint(x: 0.50, y: 1.00)

        ),

        Segment(

            line:    CGPoint(x: 0.95, y: 0.80 - adjustment),

            curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),

            control: CGPoint(x: 1.00, y: 0.75 - adjustment)

        ),

        Segment(

            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),

            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),

            control: CGPoint(x: 1.00, y: 0.25 + adjustment)

        )

    ]
}
