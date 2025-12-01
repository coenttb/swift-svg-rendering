//
//  SVG._Attributes.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

import OrderedCollections

/// A wrapper that adds attributes to an SVG element.
extension SVG {
    public struct _Attributes<Content: SVG.View>: SVG.View {
        let content: Content
        let attributes: OrderedDictionary<String, String>

        public init(content: Content, attributes: OrderedDictionary<String, String>) {
            self.content = content
            self.attributes = attributes
        }

        public static func _render<Buffer: RangeReplaceableCollection>(
            _ svg: Self,
            into buffer: inout Buffer,
            context: inout SVGContext
        ) where Buffer.Element == UInt8 {
            for (key, value) in svg.attributes {
                context.attributes[key] = value
            }
            Content._render(svg.content, into: &buffer, context: &context)
        }

        public var body: Never { fatalError() }
    }
}

extension SVG._Attributes {
    /// Adds another attribute to the element.
    public func attribute(_ name: String, _ value: String? = "") -> SVG._Attributes<Content> {
        var newAttributes = self.attributes
        if let value {
            newAttributes[name] = value
        }
        return SVG._Attributes(content: content, attributes: newAttributes)
    }
}
