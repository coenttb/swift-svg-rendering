public import Render

extension Render._Tuple: SVG.View where repeat each Content: SVG.View {
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
