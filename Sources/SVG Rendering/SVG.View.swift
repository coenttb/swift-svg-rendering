import Dictionary_Ordered
import Dimension
import Format
public import Render

public enum SVG {}

extension SVG {
    public protocol View {
        associatedtype Content: SVG.View
        @SVG.Builder var body: Content { get }

        static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: Self,
            into buffer: inout Buffer,
            context: inout SVG.Context
        ) where Buffer.Element == UInt8
    }
}

extension SVG.View where Content: SVG.View {
    @inlinable
    @_disfavoredOverload
    public static func _render<Buffer: RangeReplaceableCollection>(
        _ svg: Self,
        into buffer: inout Buffer,
        context: inout SVG.Context
    ) where Buffer.Element == UInt8 {
        Content._render(svg.body, into: &buffer, context: &context)
    }
}

extension SVG.View {
    public func attribute(_ name: String, _ value: String? = "") -> SVG._Attributes<Self> {
        var attrs = SVG.Context.Attributes()
        if let value {
            attrs.set(name, value)
        }
        return SVG._Attributes(content: self, attributes: attrs)
    }

    public func attribute(_ name: String, _ value: Double?) -> SVG._Attributes<Self> {
        attribute(name, value?.formatted(.number))
    }

    public func attribute<Tag>(
        _ name: String,
        _ value: Tagged<Tag, Double>?
    ) -> SVG._Attributes<Self> {
        attribute(name, value?.formatted(.number))
    }
}

extension CustomStringConvertible where Self: SVG.View {
    public var description: String {
        String(self)
    }
}
