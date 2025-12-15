//
//  Never+SVG.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

public import Rendering

/// Conformance of `Never` to `Renderable` to support the type system.
///
/// This provides the `Renderable` conformance with `SVG.Context` as the context type.
extension Never: @retroactive Renderable {
    public typealias Content = Never
    public typealias Context = SVG.Context
    public typealias Output = UInt8

    @inlinable
    public static func _render<Buffer: RangeReplaceableCollection>(
        _ markup: Self,
        into buffer: inout Buffer,
        context: inout SVG.Context
    ) where Buffer.Element == UInt8 {}

    public var body: Never { fatalError("body should not be called") }
}

/// Conformance of `Never` to `SVG.View` to support the type system.
///
/// This conformance is provided to allow the use of the `SVG.View` protocol in
/// contexts where no content is expected or possible.
extension Never: SVG.View {}
