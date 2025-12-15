//
//  SVG.Text.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

import INCITS_4_1986

/// Represents plain text content in SVG, with proper XML escaping.
///
/// `SVG.Text` handles escaping special characters in text content to ensure
/// proper SVG/XML rendering without security vulnerabilities.
extension SVG {
    public struct Text: SVG.View {
        /// The raw text content.
        let text: String

        /// Creates a new SVG text component with the given text.
        ///
        /// - Parameter text: The text content to represent.
        public init(_ text: String) {
            self.text = text
        }

        /// Renders the text content with proper XML escaping.
        ///
        /// This method escapes special characters (`&`, `<`, `>`, `"`, `'`) to prevent XML injection
        /// and ensure the text renders correctly in an SVG document.
        ///
        /// - Parameters:
        ///   - svg: The SVG text to render.
        ///   - buffer: The buffer to render the SVG into.
        ///   - context: The rendering context.
        public static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: Self,
            into buffer: inout Buffer,
            context: inout SVG.Context
        ) where Buffer.Element == UInt8 {
            buffer.reserveCapacity(buffer.count + svg.text.utf8.count)
            for byte in svg.text.utf8 {
                switch byte {
                case UInt8.ascii.ampersand:
                    buffer.append(contentsOf: "&amp;".utf8)
                case UInt8.ascii.lt:
                    buffer.append(contentsOf: "&lt;".utf8)
                case UInt8.ascii.gt:
                    buffer.append(contentsOf: "&gt;".utf8)
                case UInt8.ascii.dquote:
                    buffer.append(contentsOf: "&quot;".utf8)
                case UInt8.ascii.apostrophe:
                    buffer.append(contentsOf: "&apos;".utf8)
                default:
                    buffer.append(byte)
                }
            }
        }

        /// This type uses direct rendering and doesn't have a body.
        public var body: Never { fatalError("body should not be called") }

        /// Concatenates two SVG text components.
        ///
        /// - Parameters:
        ///   - lhs: The left-hand side text.
        ///   - rhs: The right-hand side text.
        /// - Returns: A new SVG text component containing the concatenated text.
        public static func + (lhs: Self, rhs: Self) -> Self {
            SVG.Text(lhs.text + rhs.text)
        }
    }
}

/// Allows SVG text to be created from string literals.
extension SVG.Text: ExpressibleByStringLiteral {
    /// Creates a new SVG text component from a string literal.
    ///
    /// - Parameter value: The string literal to use as content.
    public init(stringLiteral value: String) {
        self.init(value)
    }
}

/// Allows SVG text to be created with string interpolation.
extension SVG.Text: ExpressibleByStringInterpolation {}
