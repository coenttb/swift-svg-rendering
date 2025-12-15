//
//  SVG._Tuple.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

public import Rendering

// Extend the _Tuple type from Rendering module to conform to SVG.View
// Note: _Tuple is a top-level type exported from the Rendering module.
// Users can access it as _Tuple<Content...> directly, not through SVG._Tuple.
extension _Tuple: @retroactive Renderable where repeat each Content: SVG.View {
    public typealias Context = SVG.Context
    public typealias Content = Never
    public typealias Output = UInt8
    public var body: Never { fatalError("body should not be called") }

    public static func _render<Buffer: RangeReplaceableCollection>(
        _ svg: Self,
        into buffer: inout Buffer,
        context: inout SVG.Context
    ) where Buffer.Element == UInt8 {
        func render<T: SVG.View>(_ element: T) {
            let oldAttributes = context.attributes
            defer { context.attributes = oldAttributes }
            T._render(element, into: &buffer, context: &context)
        }
        repeat render(each svg.content)
    }
}

extension _Tuple: SVG.View where repeat each Content: SVG.View {}
