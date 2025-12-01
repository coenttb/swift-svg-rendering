//
//  StringProtocol+SVG.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

import Renderable

extension StringProtocol {
    /// Creates a String from rendered SVG content.
    ///
    /// This is a **derived transformation** where String is constructed from
    /// the canonical byte representation (`ContiguousArray<UInt8>`).
    ///
    /// ## Transformation Chain
    ///
    /// ```
    /// SVG → ContiguousArray<UInt8> → String
    ///  ↑           ↑ (canonical)        ↑ (derived)
    ///  |           |                     |
    /// Protocol  Byte Representation  User-facing
    /// ```
    ///
    /// ## Example
    ///
    /// ```swift
    /// let icon = circle(cx: 50, cy: 50, r: 40)
    /// let svgString = try String(icon)
    /// print(svgString)
    /// ```
    ///
    /// - Parameters:
    ///   - svg: The SVG content to render as a string
    ///   - configuration: Rendering configuration. Uses default if nil.
    public init(
        _ svg: some SVG.View,
        configuration: SVGContext.Configuration? = nil
    ) throws {
        let bytes = ContiguousArray(svg, configuration: configuration)
        self = Self(decoding: bytes, as: UTF8.self)
    }
}

extension StringProtocol {
    /// Asynchronously render SVG to a String.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let icon = circle(cx: 50, cy: 50, r: 40)
    /// let string = await String(icon)
    /// ```
    ///
    /// - Parameters:
    ///   - svg: The SVG content to render.
    ///   - configuration: Rendering configuration. Uses default if nil.
    @inlinable
    public init<T: SVG.View>(
        _ view: T,
        configuration: SVGContext.Configuration? = nil
    ) async {
        let bytes = await [UInt8](view, configuration: configuration)
        self = Self(decoding: bytes, as: UTF8.self)
    }
}
