//
//  SVG.Element.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp
//

import INCITS_4_1986
import OrderedCollections
import Renderable

extension SVG {
    /// Represents an SVG element with a tag, attributes, and optional content.
    ///
    /// `SVG.Element` is a fundamental building block in the SVG Renderable library,
    /// representing a standard SVG element with a tag name, attributes, and optional
    /// child content. This type handles the rendering of both opening and closing tags,
    /// attribute formatting, and proper indentation.
    ///
    /// Example:
    /// ```swift
    /// let element = SVG.Element(tag: "circle") {
    ///     // child content
    /// }
    /// ```
    ///
    /// This type is typically not used directly by library consumers, who would
    /// instead use the W3C SVG types with callAsFunction extensions.
    public struct Element<Content: SVG.View>: SVG.View {
        /// The SVG tag name (e.g., "circle", "rect", "path").
        let tag: String

        /// The optional content contained within this element.
        @SVG.Builder public let content: Content?

        /// Creates a new SVG element with the specified tag and content.
        ///
        /// - Parameters:
        ///   - tag: The SVG tag name (e.g., "circle", "rect", "path").
        ///   - content: A closure that returns the content of this element.
        ///              If no content is provided, the element will be empty.
        public init(tag: String, @SVG.Builder content: () -> Content? = { Never?.none }) {
            self.tag = tag
            self.content = content()
        }

        /// Renders this SVG element into the provided buffer.
        public static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: Self,
            into buffer: inout Buffer,
            context: inout SVG.Context
        ) where Buffer.Element == UInt8 {
            // Add newline and indentation (skip leading newline at root level)
            if !context.currentIndentation.isEmpty {
                buffer.append(contentsOf: context.configuration.newline)
            }
            buffer.append(contentsOf: context.currentIndentation)

            // Write opening tag
            buffer.append(.ascii.lessThanSign)
            buffer.append(contentsOf: svg.tag.utf8)

            // Add attributes from context (set via method chaining like .fill(), .cx(), etc.)
            for (name, value) in context.attributes {
                buffer.append(.ascii.space)
                buffer.append(contentsOf: name.utf8)
                if !value.isEmpty {
                    buffer.append(.ascii.equalsSign)
                    buffer.append(.ascii.dquote)

                    // Single-pass: iterate directly over UTF-8 view, escape as needed
                    for byte in value.utf8 {
                        switch byte {
                        case .ascii.dquote:
                            buffer.append(contentsOf: [UInt8].svg.doubleQuotationMark)
                        case .ascii.apostrophe:
                            buffer.append(contentsOf: [UInt8].svg.apostrophe)
                        case .ascii.ampersand:
                            buffer.append(contentsOf: [UInt8].svg.ampersand)
                        case .ascii.lessThanSign:
                            buffer.append(contentsOf: [UInt8].svg.lessThan)
                        case .ascii.greaterThanSign:
                            buffer.append(contentsOf: [UInt8].svg.greaterThan)
                        default:
                            buffer.append(byte)
                        }
                    }

                    buffer.append(.ascii.dquote)
                }
            }
            buffer.append(.ascii.greaterThanSign)

            // Render content if present
            if let content = svg.content {
                let oldAttributes = context.attributes
                let oldIndentation = context.currentIndentation
                defer {
                    context.attributes = oldAttributes
                    context.currentIndentation = oldIndentation
                }
                context.attributes.removeAll()
                context.currentIndentation += context.configuration.indentation
                Content._render(content, into: &buffer, context: &context)
            }

            // Add closing tag (SVG elements are not void/self-closing in the HTML sense)
            buffer.append(contentsOf: context.configuration.newline)
            buffer.append(contentsOf: context.currentIndentation)
            buffer.append(.ascii.lessThanSign)
            buffer.append(.ascii.slant)
            buffer.append(contentsOf: svg.tag.utf8)
            buffer.append(.ascii.greaterThanSign)
        }

        /// This type uses direct rendering and doesn't have a body.
        public var body: Never {
            fatalError()
        }
    }
}

extension SVG.Element: Sendable where Content: Sendable {}

// MARK: - SVG Escape Sequences

extension [UInt8] {
    /// SVG-specific escape sequences for attribute values.
    public enum svg {
        /// The escaped representation of a double quotation mark (`"`).
        public static let doubleQuotationMark: [UInt8] = [
            .ascii.ampersand, .ascii.q, .ascii.u, .ascii.o, .ascii.t, .ascii.semicolon,
        ]

        /// The escaped representation of an apostrophe (`'`).
        public static let apostrophe: [UInt8] = [
            .ascii.ampersand, .ascii.a, .ascii.p, .ascii.o, .ascii.s, .ascii.semicolon,
        ]

        /// The escaped representation of an ampersand (`&`).
        public static let ampersand: [UInt8] = [
            .ascii.ampersand, .ascii.a, .ascii.m, .ascii.p, .ascii.semicolon,
        ]

        /// The escaped representation of a less-than sign (`<`).
        public static let lessThan: [UInt8] = [
            .ascii.ampersand, .ascii.l, .ascii.t, .ascii.semicolon,
        ]

        /// The escaped representation of a greater-than sign (`>`).
        public static let greaterThan: [UInt8] = [
            .ascii.ampersand, .ascii.g, .ascii.t, .ascii.semicolon,
        ]
    }
}
