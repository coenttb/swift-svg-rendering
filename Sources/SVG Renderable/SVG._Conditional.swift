//
//  SVG._Conditional.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

/// A type to represent conditional SVG content based on if/else conditions.
///
/// This type is used internally by the `SVG.Builder` to handle
/// conditional content created by `if`/`else` statements.
extension SVG {
    public enum _Conditional<First: SVG.View, Second: SVG.View>: SVG.View {
        /// Represents the "if" or "true" case.
        case first(First)
        /// Represents the "else" or "false" case.
        case second(Second)

        /// Renders either the first or second SVG component based on the case.
        ///
        /// - Parameters:
        ///   - svg: The conditional SVG to render.
        ///   - buffer: The buffer to render the SVG into.
        ///   - context: The rendering context.
        public static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: Self,
            into buffer: inout Buffer,
            context: inout SVGContext
        ) where Buffer.Element == UInt8 {
            switch svg {
            case .first(let first):
                First._render(first, into: &buffer, context: &context)
            case .second(let second):
                Second._render(second, into: &buffer, context: &context)
            }
        }

        /// This type uses direct rendering and doesn't have a body.
        public var body: Never { fatalError() }
    }
}
