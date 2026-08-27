public import Dictionary_Ordered
import Render

extension SVG {
    public struct Context: Sendable {

        public var attributes: Attributes

        public let configuration: SVG.Context.Configuration

        public var currentIndentation: [UInt8]
    }
}

extension SVG.Context {
    public init(_ configuration: Configuration = .default) {
        self.attributes = .init()
        self.configuration = configuration
        self.currentIndentation = []
    }
}

extension SVG.Context {
    public struct Configuration: Sendable {
        public var indentation: [UInt8]
        public var newline: [UInt8]

        public init(indentation: String = "", newline: String = "") {
            self.indentation = Array(indentation.utf8)
            self.newline = Array(newline.utf8)
        }
    }
}

extension SVG.Context.Configuration {
    public static let `default` = Self()
    public static let pretty = Self(indentation: "  ", newline: "\n")
}

extension SVG.Context {
    @inlinable
    public func appendNewline<Buffer: RangeReplaceableCollection>(
        into buffer: inout Buffer
    ) where Buffer.Element == UInt8 {
        if !configuration.newline.isEmpty {
            buffer.append(contentsOf: configuration.newline)
        }
    }

    @inlinable
    public func indented() -> SVG.Context {
        var copy = self
        copy.currentIndentation.append(contentsOf: configuration.indentation)
        return copy
    }

    @inlinable
    public func outdented() -> SVG.Context {
        var copy = self
        if copy.currentIndentation.count >= configuration.indentation.count {
            copy.currentIndentation.removeLast(configuration.indentation.count)
        }
        return copy
    }

    @inlinable
    public func appendIndentation<Buffer: RangeReplaceableCollection>(
        into buffer: inout Buffer
    ) where Buffer.Element == UInt8 {
        if !configuration.indentation.isEmpty && !currentIndentation.isEmpty {
            buffer.append(contentsOf: currentIndentation)
        }
    }
}
