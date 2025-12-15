//
//  SVG.Context.swift
//  swift-svg-renderable
//
//  Rendering context for SVG streaming.
//  Holds state (attributes, indentation) separate from the output buffer.
//

public import OrderedCollections
import Rendering

/// Rendering context for SVG streaming.
///
/// `SVG.Context` holds the state needed during SVG rendering, separate from the output buffer.
/// This separation enables streaming rendering where the buffer can be any `RangeReplaceableCollection<UInt8>`.
///
/// ## Design Philosophy
///
/// The rendering state is decoupled from the output destination:
/// - **Context**: Attributes, indentation, rendering configuration
/// - **Buffer**: Where bytes are written (generic, caller-controlled)
///
/// This enables the same rendering logic to write to `[UInt8]`, `ContiguousArray<UInt8>`,
/// `Data`, `ByteBuffer`, or any other byte buffer.
extension SVG {
    public struct Context: Sendable {
        /// The current set of attributes to apply to the next SVG element.
        public var attributes: OrderedDictionary<String, String>
        
        /// Configuration for rendering, including formatting options.
        public let configuration: SVG.Context.Configuration
        
        /// The current indentation level for pretty-printing.
        public var currentIndentation: [UInt8]
    }
}

extension SVG.Context {
    /// Creates a new SVG rendering context with the specified rendering configuration.
    ///
    /// - Parameter configuration: The rendering configuration to use. Defaults to `.default`.
    public init(_ configuration: Configuration = .default) {
        self.attributes = [:]
        self.configuration = configuration
        self.currentIndentation = []
    }
}

extension SVG.Context {
    /// Configuration options for SVG rendering.
    public struct Configuration: Sendable {
        /// The indentation bytes to use for pretty-printing.
        public var indentation: [UInt8]

        /// The newline bytes to use for pretty-printing.
        public var newline: [UInt8]

        /// Creates a new configuration with the specified options.
        ///
        /// - Parameters:
        ///   - indentation: The indentation string.
        ///   - newline: The newline string.
        public init(indentation: String = "", newline: String = "") {
            self.indentation = Array(indentation.utf8)
            self.newline = Array(newline.utf8)
        }

        /// Default configuration with no formatting.
        public static let `default` = Configuration()

        /// Configuration for pretty-printed output.
        public static let pretty = Configuration(indentation: "  ", newline: "\n")
    }
}

extension SVG.Context {
    /// Appends a newline to the buffer if configured for pretty printing.
    @inlinable
    public func appendNewline<Buffer: RangeReplaceableCollection>(
        into buffer: inout Buffer
    ) where Buffer.Element == UInt8 {
        if !configuration.newline.isEmpty {
            buffer.append(contentsOf: configuration.newline)
        }
    }

    /// Returns a new context with increased indentation.
    @inlinable
    public func indented() -> SVG.Context {
        var copy = self
        copy.currentIndentation.append(contentsOf: configuration.indentation)
        return copy
    }

    /// Returns a new context with decreased indentation.
    @inlinable
    public func outdented() -> SVG.Context {
        var copy = self
        if copy.currentIndentation.count >= configuration.indentation.count {
            copy.currentIndentation.removeLast(configuration.indentation.count)
        }
        return copy
    }

    /// Appends the current indentation to the buffer if configured for pretty printing.
    @inlinable
    public func appendIndentation<Buffer: RangeReplaceableCollection>(
        into buffer: inout Buffer
    ) where Buffer.Element == UInt8 {
        if !configuration.indentation.isEmpty && !currentIndentation.isEmpty {
            buffer.append(contentsOf: currentIndentation)
        }
    }
}
