//
//  SVG._Array.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

/// A container for an array of SVG elements.
///
/// This type is used internally by the `SVG.Builder` to handle
/// arrays of elements, such as those created by `for` loops.
extension SVG {
    public struct _Array<Element: SVG.View>: SVG.View {
        /// The array of SVG elements contained in this container.
        let elements: [Element]

        /// Renders all elements in the array into the buffer.
        ///
        /// - Parameters:
        ///   - svg: The SVG array to render.
        ///   - buffer: The buffer to render the SVG into.
        ///   - context: The rendering context.
        public static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: Self,
            into buffer: inout Buffer,
            context: inout SVGContext
        ) where Buffer.Element == UInt8 {
            for element in svg.elements {
                Element._render(element, into: &buffer, context: &context)
            }
        }

        /// This type uses direct rendering and doesn't have a body.
        public var body: Never { fatalError() }
    }
}
