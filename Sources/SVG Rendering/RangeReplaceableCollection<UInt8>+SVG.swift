//
//  RangeReplaceableCollection<UInt8>+SVG.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

public import Rendering

extension RangeReplaceableCollection<UInt8> {
    /// Creates a byte collection from rendered SVG.
    ///
    /// This is the canonical way to render SVG to bytes when you need the
    /// complete document. Works with any `RangeReplaceableCollection<UInt8>`.
    ///
    /// ## When to Use
    ///
    /// Use `[UInt8](svg)` when:
    /// - You need the complete document
    /// - The document is small to medium sized
    /// - Simplicity is preferred over streaming
    ///
    /// ## Canonical Usage
    ///
    /// ```swift
    /// let bytes = [UInt8](myIcon)
    /// ```
    ///
    /// - Parameters:
    ///   - view: The SVG content to render to bytes
    ///   - configuration: Rendering configuration. Uses default if nil.
    @inlinable
    public init<View: SVG.View>(
        _ view: View,
        configuration: SVG.Context.Configuration? = nil
    ) {
        var buffer = Self()
        var context = SVG.Context(configuration ?? .default)
        View._render(view, into: &buffer, context: &context)
        self = buffer
    }
}

extension RangeReplaceableCollection<UInt8> {
    /// Asynchronously render SVG to a byte collection.
    ///
    /// This yields to the scheduler during rendering to avoid blocking,
    /// making it suitable for use in async contexts where responsiveness matters.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let icon = circle(cx: 50, cy: 50, r: 40)
    /// let bytes: [UInt8] = await .init(icon)
    /// ```
    ///
    /// - Parameters:
    ///   - view: The SVG content to render.
    ///   - configuration: Rendering configuration. Uses default if nil.
    @inlinable
    public init<View: SVG.View>(
        _ view: View,
        configuration: SVG.Context.Configuration? = nil
    ) async {
        await Task.yield()
        var buffer = Self()
        var context = SVG.Context(configuration ?? .default)
        View._render(view, into: &buffer, context: &context)
        self = buffer
    }
}
