//
//  SVG.AnyView.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

/// Type-erased SVG element that can hold any SVG content.
extension SVG {
    public struct AnyView: SVG.View {
        let base: any SVG.View

        public init(_ base: any SVG.View) {
            self.base = base
        }

        public static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: SVG.AnyView,
            into buffer: inout Buffer,
            context: inout SVG.Context
        ) where Buffer.Element == UInt8 {
            func render<T: SVG.View>(_ element: T) {
                T._render(element, into: &buffer, context: &context)
            }
            render(svg.base)
        }

        public var body: Never { fatalError("body should not be called") }
    }
}

extension SVG.AnyView {
    public init(_ closure: () -> any SVG.View) {
        self = .init(closure())
    }
}
