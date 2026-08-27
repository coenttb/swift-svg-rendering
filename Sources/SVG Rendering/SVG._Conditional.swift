public import Render

extension Render.Conditional: SVG.View where First: SVG.View, Second: SVG.View {
    public var body: Never { fatalError("body should not be called") }

    public static func _render<Buffer: RangeReplaceableCollection>(
        _ svg: Self,
        into buffer: inout Buffer,
        context: inout SVG.Context
    ) where Buffer.Element == UInt8 {
        switch svg {
        case .first(let first): First._render(first, into: &buffer, context: &context)
        case .second(let second): Second._render(second, into: &buffer, context: &context)
        }
    }
}
