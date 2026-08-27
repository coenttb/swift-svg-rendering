import ASCII

extension SVG {
    public struct Text: SVG.View {

        let text: String

        public init(_ text: String) {
            self.text = text
        }
    }
}

extension SVG.Text {

    public static func _render<Buffer: RangeReplaceableCollection>(
        _ svg: Self,
        into buffer: inout Buffer,
        context: inout SVG.Context
    ) where Buffer.Element == UInt8 {
        buffer.reserveCapacity(buffer.count + svg.text.utf8.count)
        for byte in svg.text.utf8 {
            switch byte {
            case ASCII.Character.Graphic.ampersand:
                buffer.append(contentsOf: "&amp;".utf8)

            case ASCII.Character.Graphic.lessThanSign:
                buffer.append(contentsOf: "&lt;".utf8)

            case ASCII.Character.Graphic.greaterThanSign:
                buffer.append(contentsOf: "&gt;".utf8)

            case ASCII.Character.Graphic.quotationMark:
                buffer.append(contentsOf: "&quot;".utf8)

            case ASCII.Character.Graphic.apostrophe:
                buffer.append(contentsOf: "&apos;".utf8)

            default:
                buffer.append(byte)
            }
        }
    }

    public var body: Never { fatalError("body should not be called") }

    public static func + (lhs: Self, rhs: Self) -> Self {
        SVG.Text(lhs.text + rhs.text)
    }
}

extension SVG.Text: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        self.init(value)
    }
}

extension SVG.Text: ExpressibleByStringInterpolation {}
