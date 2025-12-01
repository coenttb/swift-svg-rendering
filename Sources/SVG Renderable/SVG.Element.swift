//
//  SVG.Element.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp
//

import INCITS_4_1986
import Numeric_Formatting
import OrderedCollections
import Renderable
import SVG_Standard

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
    /// let element = SVG.Element(SVG_Standard.Shapes.Circle(cx: 50, cy: 50, r: 40)) {
    ///     // child content
    /// }
    /// ```
    ///
    /// This type is typically not used directly by library consumers, who would
    /// instead use the more convenient element functions like `circle`, `rect`, `path`, etc.
    public struct Element<ElementType: SVGElementType, Content: SVG.View>: SVG.View {
        /// The SVG element type containing the element's properties.
        public let element: ElementType

        /// The optional content contained within this element.
        @SVG.Builder public let content: Content?

        /// Creates a new SVG element with the specified element type and content.
        ///
        /// - Parameters:
        ///   - element: The SVG element type (e.g., Circle, Rectangle, Path).
        ///   - content: A closure that returns the content of this element.
        ///              If no content is provided, the element will be empty.
        public init(_ element: ElementType, @SVG.Builder content: () -> Content? = { Never?.none }) {
            self.element = element
            self.content = content()
        }

        /// Renders this SVG element into the provided buffer.
        public static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: Self,
            into buffer: inout Buffer,
            context: inout SVGContext
        ) where Buffer.Element == UInt8 {
            let tagName = ElementType.tagName
            let isSelfClosing = ElementType.isSelfClosing

            // First, collect attributes from content by pre-rendering to a temporary buffer
            var collectedAttributes = OrderedDictionary<String, String>()
            var actualContent: [UInt8] = []

            if let content = svg.content {
                var tempContext = context
                tempContext.attributes.removeAll()
                tempContext.currentIndentation = context.currentIndentation + context.configuration.indentation
                Content._render(content, into: &actualContent, context: &tempContext)
                collectedAttributes = tempContext.attributes
            }

            // Add newline and indentation
            buffer.append(contentsOf: context.configuration.newline)
            buffer.append(contentsOf: context.currentIndentation)

            // Write opening tag
            buffer.append(.ascii.lessThanSign)
            buffer.append(contentsOf: tagName.utf8)

            // Add element-specific attributes from the element type
            renderElementAttributes(svg.element, into: &buffer)

            // Add attributes from context (set by method chaining like .fill("red"))
            for (name, value) in context.attributes {
                buffer.append(.ascii.space)
                buffer.append(contentsOf: name.utf8)
                if !value.isEmpty {
                    buffer.append(.ascii.equalsSign)
                    buffer.append(.ascii.dquote)
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

            // Add collected attributes from content
            for (name, value) in collectedAttributes {
                buffer.append(.ascii.space)
                buffer.append(contentsOf: name.utf8)
                if !value.isEmpty {
                    buffer.append(.ascii.equalsSign)
                    buffer.append(.ascii.dquote)
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

            // Handle self-closing vs content
            let hasActualContent = !actualContent.isEmpty
            if isSelfClosing && !hasActualContent {
                buffer.append(.ascii.greaterThanSign)
            } else {
                buffer.append(.ascii.greaterThanSign)

                // Append the pre-rendered content
                buffer.append(contentsOf: actualContent)

                // Add closing tag
                buffer.append(contentsOf: context.configuration.newline)
                buffer.append(contentsOf: context.currentIndentation)
                buffer.append(.ascii.lessThanSign)
                buffer.append(.ascii.slant)
                buffer.append(contentsOf: tagName.utf8)
                buffer.append(.ascii.greaterThanSign)
            }
        }

        /// This type uses direct rendering and doesn't have a body.
        public var body: Never {
            fatalError()
        }

        /// Properties that should be rendered as element content, not attributes
        private static var contentProperties: Set<String> { ["content"] }

        /// Renders element-specific attributes from the element type.
        private static func renderElementAttributes<Buffer: RangeReplaceableCollection>(
            _ element: ElementType,
            into buffer: inout Buffer
        ) where Buffer.Element == UInt8 {
            // Use reflection to get element properties and render as attributes
            let mirror = Mirror(reflecting: element)
            for child in mirror.children {
                guard let label = child.label else { continue }

                // Skip properties that should be text content
                if contentProperties.contains(label) { continue }

                // Skip nil optionals
                let valueMirror = Mirror(reflecting: child.value)
                if valueMirror.displayStyle == .optional {
                    if valueMirror.children.isEmpty {
                        continue
                    }
                    // Unwrap the optional
                    if let (_, unwrappedValue) = valueMirror.children.first {
                        renderAttribute(name: label, value: unwrappedValue, into: &buffer)
                    }
                } else {
                    renderAttribute(name: label, value: child.value, into: &buffer)
                }
            }
        }

        /// Extracts the text content property from an element type.
        static func extractTextContent(_ element: ElementType) -> String? {
            let mirror = Mirror(reflecting: element)
            for child in mirror.children {
                guard let label = child.label, label == "content" else { continue }

                let valueMirror = Mirror(reflecting: child.value)
                if valueMirror.displayStyle == .optional {
                    if let (_, unwrappedValue) = valueMirror.children.first {
                        return String(describing: unwrappedValue)
                    }
                    return nil
                } else {
                    return String(describing: child.value)
                }
            }
            return nil
        }

        /// Renders a single attribute.
        private static func renderAttribute<Buffer: RangeReplaceableCollection>(
            name: String,
            value: Any,
            into buffer: inout Buffer
        ) where Buffer.Element == UInt8 {
            // Convert camelCase to kebab-case for SVG attributes
            let attributeName = camelToKebab(name)
            let stringValue = attributeStringValue(value)

            buffer.append(.ascii.space)
            buffer.append(contentsOf: attributeName.utf8)
            buffer.append(.ascii.equalsSign)
            buffer.append(.ascii.dquote)

            // Escape attribute value
            for byte in stringValue.utf8 {
                switch byte {
                case .ascii.dquote:
                    buffer.append(contentsOf: [UInt8].svg.doubleQuotationMark)
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

        /// Converts a value to its SVG attribute string representation.
        private static func attributeStringValue(_ value: Any) -> String {
            // Handle common types with custom formatting
            switch value {
            case let double as Double:
                // Format doubles without unnecessary decimal places using numeric formatting
                return double.formatted(.number)
            case let int as Int:
                return String(int)
            case let string as String:
                return string
            case let length as SVG_Standard.Types.Length:
                return length.stringValue
            case let viewBox as SVG_Standard.Types.ViewBox:
                return viewBox.stringValue
            default:
                return String(describing: value)
            }
        }

        /// Converts camelCase to kebab-case, preserving SVG-specific camelCase attributes.
        private static func camelToKebab(_ string: String) -> String {
            // Check if this attribute should remain camelCase
            if SVGCamelCaseAttributes.set.contains(string) {
                return string
            }

            var result = ""
            for (index, char) in string.enumerated() {
                if char.isUppercase {
                    if index > 0 {
                        result.append("-")
                    }
                    result.append(char.lowercased())
                } else {
                    result.append(char)
                }
            }
            return result
        }
    }
}

extension SVG.Element: Sendable where ElementType: Sendable, Content: Sendable {}

/// SVG attributes that should remain in camelCase (not converted to kebab-case)
private enum SVGCamelCaseAttributes {
    static let set: Set<String> = [
        "viewBox",
        "preserveAspectRatio",
        "patternUnits",
        "patternContentUnits",
        "gradientUnits",
        "gradientTransform",
        "spreadMethod",
        "clipPathUnits",
        "maskUnits",
        "maskContentUnits",
        "filterUnits",
        "primitiveUnits",
        "markerUnits",
        "markerWidth",
        "markerHeight",
        "refX",
        "refY",
        "textLength",
        "lengthAdjust",
        "startOffset",
        "baseFrequency",
        "numOctaves",
        "targetX",
        "targetY",
        "stdDeviation",
        "tableValues",
        "pathLength",
        "repeatCount",
        "repeatDur",
        "attributeName",
        "attributeType",
        "calcMode",
        "keyTimes",
        "keySplines",
        "keyPoints",
        "xChannelSelector",
        "yChannelSelector",
    ]
}

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
