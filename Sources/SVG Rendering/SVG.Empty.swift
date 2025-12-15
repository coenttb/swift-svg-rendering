//
//  SVG.Empty.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

/// An empty SVG element that renders nothing.
///
/// This type is useful as a placeholder or when conditionally
/// rendering content that might be empty.
extension SVG {
    public struct Empty: SVG.View {
        /// Creates an empty SVG element.
        public init() {}

        /// Renders nothing into the buffer.
        public static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: Self,
            into buffer: inout Buffer,
            context: inout SVG.Context
        ) where Buffer.Element == UInt8 {
            // Intentionally empty
        }

        public var body: Never { fatalError("body should not be called") }
    }
}
