//
//  SVG.Raw.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

/// An SVG element that renders raw SVG content without escaping.
///
/// Use this type when you need to include pre-formatted SVG content
/// or when working with SVG strings from external sources.
///
/// - Warning: Content is not escaped. Ensure the SVG content is safe
///   and properly formatted to avoid injection vulnerabilities.
extension SVG {
    public struct Raw: SVG.View {
        /// The raw SVG content to render.
        let content: String

        /// Creates a raw SVG element with the given content.
        ///
        /// - Parameter content: The raw SVG content to render.
        public init(_ content: String) {
            self.content = content
        }

        /// Renders the raw content directly into the buffer.
        public static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: Self,
            into buffer: inout Buffer,
            context: inout SVGContext
        ) where Buffer.Element == UInt8 {
            buffer.append(contentsOf: svg.content.utf8)
        }

        public var body: Never { fatalError() }
    }
}
