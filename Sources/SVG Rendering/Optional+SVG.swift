//
//  Optional+SVG.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

/// Allows optional values to be used as SVG elements.
///
/// This conformance allows for convenient handling of optional SVG content,
/// where `nil` values simply render nothing.
extension Optional: SVG.View where Wrapped: SVG.View {
    /// Renders the optional SVG element if it exists.
    ///
    /// - Parameters:
    ///   - svg: The optional SVG to render.
    ///   - buffer: The buffer to render the SVG into.
    ///   - context: The rendering context.
    public static func _render<Buffer: RangeReplaceableCollection>(
        _ svg: Self,
        into buffer: inout Buffer,
        context: inout SVG.Context
    ) where Buffer.Element == UInt8 {
        guard let svg else { return }
        Wrapped._render(svg, into: &buffer, context: &context)
    }

    /// This type uses direct rendering and doesn't have a body.
    public var body: Never { fatalError() }
}
