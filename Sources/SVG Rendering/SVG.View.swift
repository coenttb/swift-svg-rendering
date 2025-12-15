//
//  SVG.View.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

import Dimension
import OrderedCollections
public import Rendering

/// A namespace for SVG-related types.
public enum SVG {}

extension SVG {
    /// A protocol representing an SVG element or component that can be rendered.
    ///
    /// The `SVG.View` protocol is the core abstraction of the SVG Renderable library,
    /// allowing Swift types to represent SVG content in a declarative, composable manner.
    /// It uses a component-based architecture similar to SwiftUI and HTML.View,
    /// where each component defines its `body` property to build up a hierarchy of SVG elements.
    ///
    /// Example:
    /// ```swift
    /// struct MyIcon: SVG.View {
    ///     var body: some SVG.View {
    ///         svg(width: 100, height: 100) {
    ///             circle(cx: 50, cy: 50, r: 40) {
    ///                 fill("red")
    ///                 stroke("black", width: 3)
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// - Note: This protocol is similar in design to SwiftUI's `View` protocol,
    ///   making it familiar to Swift developers who have worked with SwiftUI.
    public protocol View: Renderable where Content: SVG.View, Context == SVG.Context, Output == UInt8 {
        @SVG.Builder var body: Content { get }
    }
}

extension SVG.View {
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

/// Extension to add attribute capabilities to all SVG elements.
extension SVG.View {
    /// Adds a custom attribute to an SVG element.
    ///
    /// This method allows you to set any attribute on an SVG element,
    /// providing flexibility for both standard and custom attributes.
    ///
    /// Example:
    /// ```swift
    /// circle(cx: 50, cy: 50, r: 40)
    ///     .attribute("id", "main-circle")
    ///     .attribute("class", "highlight")
    /// ```
    ///
    /// - Parameters:
    ///   - name: The name of the attribute.
    ///   - value: The optional value of the attribute. If nil, the attribute is omitted.
    ///            If an empty string, the attribute is included without a value.
    /// - Returns: An SVG element with the attribute applied.
    public func attribute(_ name: String, _ value: String? = "") -> SVG._Attributes<Self> {
        SVG._Attributes(content: self, attributes: value.map { [name: $0] } ?? [:])
    }
    
    public func attribute(_ name: String, _ value: Double?) -> SVG._Attributes<Self> {
        attribute(name, value?.formatted(.number))
    }

    /// Generic attribute setter for any Tagged type with a FloatingPoint raw value.
    public func attribute<Tag>(_ name: String, _ value: Tagged<Tag, Double>?) -> SVG._Attributes<Self> {
        attribute(name, value?.formatted(.number))
    }
}

/// Provides a default `description` implementation for SVG types that also conform to `CustomStringConvertible`.
extension CustomStringConvertible where Self: SVG.View {
    public var description: String {
        String(self)
    }
}
