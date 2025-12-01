//
//  SVG._Tuple.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

/// A container for a tuple of SVG elements.
///
/// This type is used internally by the `SVG.Builder` to handle
/// multiple SVG elements combined in a single block.
extension SVG {
    public struct _Tuple<each Content: SVG.View>: SVG.View {
        /// The tuple of SVG elements.
        let content: (repeat each Content)

        /// Creates a new tuple of SVG elements.
        ///
        /// - Parameter content: The tuple of SVG elements.
        init(content: repeat each Content) {
            self.content = (repeat each content)
        }

        /// Renders all elements in the tuple into the buffer.
        ///
        /// - Parameters:
        ///   - svg: The SVG tuple to render.
        ///   - buffer: The buffer to render the SVG into.
        ///   - context: The rendering context.
        public static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: Self,
            into buffer: inout Buffer,
            context: inout SVG.Context
        ) where Buffer.Element == UInt8 {
            func render<T: SVG.View>(_ element: T) {
                T._render(element, into: &buffer, context: &context)
            }
            repeat render(each svg.content)
        }

        /// This type uses direct rendering and doesn't have a body.
        public var body: Never { fatalError() }
    }
}
