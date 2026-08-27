public import Dictionary_Ordered
import Render

extension SVG {
    public struct _Attributes<Content: SVG.View>: SVG.View {
        let content: Content
        let attributes: SVG.Context.Attributes

        public init(content: Content, attributes: SVG.Context.Attributes) {
            self.content = content
            self.attributes = attributes
        }

        public static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: Self,
            into buffer: inout Buffer,
            context: inout SVG.Context
        ) where Buffer.Element == UInt8 {
            let previousValue = context.attributes
            defer { context.attributes = previousValue }
            svg.attributes.forEach { key, value in
                context.attributes.set(key, value)
            }
            Content._render(svg.content, into: &buffer, context: &context)
        }

        public var body: Never { fatalError("body should not be called") }
    }
}

extension SVG._Attributes {

    public func attribute(_ name: String, _ value: String? = "") -> SVG._Attributes<Content> {
        var newAttributes = self.attributes
        if let value {
            newAttributes.set(name, value)
        }
        return SVG._Attributes(content: content, attributes: newAttributes)
    }
}
