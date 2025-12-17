//
//  SVG.Elements.swift
//  swift-svg-rendering
//
//  callAsFunction extensions for W3C SVG types
//

import Formatting
public import SVG_Standard

// MARK: - Basic Shapes

extension SVG_Standard.Shapes.Circle {
    /// Renders the circle element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .cx(self.cx)
            .cy(self.cy)
            .r(self.r)
    }
}

extension SVG_Standard.Shapes.Rectangle {
    /// Renders the rect element with optional child content.
    ///
    /// Corner radii (rx, ry) can be applied using modifiers:
    /// ```swift
    /// rect().rx(5).ry(5)
    /// ```
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
    }
}

extension SVG_Standard.Shapes.Ellipse {
    /// Renders the ellipse element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .cx(self.cx)
            .cy(self.cy)
            .rx(self.rx)
            .ry(self.ry)
    }
}

extension SVG_Standard.Shapes.Line {
    /// Renders the line element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .x1(self.x1)
            .y1(self.y1)
            .x2(self.x2)
            .y2(self.y2)
    }
}

extension SVG_Standard.Shapes.Polygon {
    /// Renders the polygon element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .points(self.points)
    }
}

extension SVG_Standard.Shapes.Polyline {
    /// Renders the polyline element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .points(self.points)
    }
}

// MARK: - Paths

extension SVG_Standard.Paths.Path {
    /// Renders the path element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .d(self.d)
            .fillRule(self.fillRule?.rawValue)
    }
}

// MARK: - Document Structure

extension SVG_Standard.Document.SVG {
    /// Renders the svg element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .x(self.x?.description)
            .y(self.y?.description)
            .width(self.width?.description)
            .height(self.height?.description)
            .viewBox(self.viewBox?.description)
    }
}

extension SVG_Standard.Document.Group {
    /// Renders the g element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .id(self.id)
    }
}

extension SVG_Standard.Document.Defs {
    /// Renders the defs element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
    }
}

extension SVG_Standard.Document.Symbol {
    /// Renders the symbol element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .id(self.id)
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
            .viewBox(self.viewBox?.description)
            .refX(self.refX)
            .refY(self.refY)
            .preserveAspectRatio(self.preserveAspectRatio)
    }
}

extension SVG_Standard.Document.Use {
    /// Renders the use element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .href(self.href)
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
    }
}

// MARK: - Text

extension SVG_Standard.Text.Text {
    /// Renders the text element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) {
            if let textContent = self.content {
                SVG.Text(textContent)
            }
            content()
        }
        .x(self.x)
        .y(self.y)
        .dx(self.dx)
        .dy(self.dy)
    }
}

extension SVG_Standard.Text.TSpan {
    /// Renders the tspan element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) {
            if let textContent = self.content {
                SVG.Text(textContent)
            }
            content()
        }
        .x(self.x)
        .y(self.y)
        .dx(self.dx)
        .dy(self.dy)
    }
}

// MARK: - Paint Servers (Gradients & Patterns)

extension SVG_Standard.PaintServers.LinearGradient {
    /// Renders the linearGradient element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .id(self.id)
            .x1(self.x1)
            .y1(self.y1)
            .x2(self.x2)
            .y2(self.y2)
            .href(self.href)
            .gradientUnits(self.gradientUnits?.rawValue)
            .gradientTransform(self.gradientTransform)
            .spreadMethod(self.spreadMethod?.rawValue)
    }
}

extension SVG_Standard.PaintServers.RadialGradient {
    /// Renders the radialGradient element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .id(self.id)
            .cx(self.cx)
            .cy(self.cy)
            .r(self.r)
            .fx(self.fx)
            .fy(self.fy)
            .fr(self.fr)
            .href(self.href)
            .gradientUnits(self.gradientUnits?.rawValue)
            .gradientTransform(self.gradientTransform)
            .spreadMethod(self.spreadMethod?.rawValue)
    }
}

extension SVG_Standard.PaintServers.Stop {
    /// Renders the stop element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .offset(self.offset)
            .stopColor(self.stopColor)
            .stopOpacity(self.stopOpacity)
    }
}

extension SVG_Standard.PaintServers.Pattern {
    /// Renders the pattern element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .id(self.id)
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
            .viewBox(self.viewBox?.description)
            .href(self.href)
            .patternUnits(self.patternUnits?.rawValue)
            .patternContentUnits(self.patternContentUnits?.rawValue)
            .patternTransform(self.patternTransform)
            .preserveAspectRatio(self.preserveAspectRatio)
    }
}

// MARK: - Painting (Clipping, Masking, Markers)

extension SVG_Standard.Painting.ClipPath {
    /// Renders the clipPath element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .id(self.id)
            .clipPathUnits(self.clipPathUnits?.rawValue)
    }
}

extension SVG_Standard.Painting.Mask {
    /// Renders the mask element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .id(self.id)
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
            .maskUnits(self.maskUnits?.rawValue)
            .maskContentUnits(self.maskContentUnits?.rawValue)
    }
}

extension SVG_Standard.Painting.Marker {
    /// Renders the marker element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .id(self.id)
            .viewBox(self.viewBox?.description)
            .refX(self.refX)
            .refY(self.refY)
            .markerWidth(self.markerWidth)
            .markerHeight(self.markerHeight)
            .orient(self.orient)
            .markerUnits(self.markerUnits?.rawValue)
            .preserveAspectRatio(self.preserveAspectRatio)
    }
}

// MARK: - Embedded Content

extension SVG_Standard.Embedded.Image {
    /// Renders the image element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
            .href(self.href)
            .preserveAspectRatio(self.preserveAspectRatio)
    }
}

extension SVG_Standard.Embedded.ForeignObject {
    /// Renders the foreignObject element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
    }
}

// MARK: - Scripting

extension SVG_Standard.Scripting.Switch {
    /// Renders the switch element with optional child content.
    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
    }
}

// MARK: - Optional Attribute Helper

extension SVG.View {
    /// Sets the id attribute if value is not nil.
    func id(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("id", value)
    }

    /// Sets the fill-rule attribute from a string value.
    func fillRule(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("fill-rule", value)
    }

    /// Sets the cx attribute for gradients (String version).
    func cx(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("cx", value)
    }

    /// Sets the cy attribute for gradients (String version).
    func cy(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("cy", value)
    }
}

// MARK: - SVG.View Conformances
// Direct conformances for W3C SVG types.
// Geometry types conform to SVG.View for direct DSL usage, and also provide .svg
// for explicit SVG-specific operations (transforms, etc.) separate from math operations.

extension Geometry.Ball: @retroactive Rendering.`Protocol`
where Scalar == Double, Space == W3C_SVG.Space, N == 2 {
    public typealias Context = SVG.Context
    public typealias Output = UInt8
}

extension Geometry.Ball: SVG.View where Scalar == Double, Space == W3C_SVG.Space, N == 2 {
    public var body: some SVG.View {
        svg
    }
}

extension Geometry.Orthotope: @retroactive Rendering.`Protocol`
where Scalar == Double, Space == W3C_SVG.Space, N == 2 {
    public typealias Context = SVG.Context
    public typealias Output = UInt8
}

extension Geometry.Orthotope: SVG.View where Scalar == Double, Space == W3C_SVG.Space, N == 2 {
    public var body: some SVG.View {
        svg
    }
}

extension SVG_Standard.Shapes.Ellipse: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .cx(self.cx)
            .cy(self.cy)
            .rx(self.rx)
            .ry(self.ry)
    }
}

extension SVG_Standard.Shapes.Line: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .x1(self.x1)
            .y1(self.y1)
            .x2(self.x2)
            .y2(self.y2)
    }
}

extension SVG_Standard.Shapes.Polygon: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .points(self.points)
    }
}

extension SVG_Standard.Shapes.Polyline: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .points(self.points)
    }
}

extension SVG_Standard.Paths.Path: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .d(self.d)
            .fillRule(self.fillRule?.rawValue)
    }
}

extension SVG_Standard.Document.SVG: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .x(self.x?.description)
            .y(self.y?.description)
            .width(self.width?.description)
            .height(self.height?.description)
            .viewBox(self.viewBox?.description)
    }
}

extension SVG_Standard.Document.Group: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .id(self.id)
    }
}

extension SVG_Standard.Document.Defs: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
    }
}

extension SVG_Standard.Document.Symbol: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .id(self.id)
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
            .viewBox(self.viewBox?.description)
            .refX(self.refX)
            .refY(self.refY)
            .preserveAspectRatio(self.preserveAspectRatio)
    }
}

extension SVG_Standard.Document.Use: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .href(self.href)
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
    }
}

extension SVG_Standard.Text.Text: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) {
            if let textContent = self.content {
                SVG.Text(textContent)
            }
        }
        .x(self.x)
        .y(self.y)
        .dx(self.dx)
        .dy(self.dy)
    }
}

extension SVG_Standard.Text.TSpan: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) {
            if let textContent = self.content {
                SVG.Text(textContent)
            }
        }
        .x(self.x)
        .y(self.y)
        .dx(self.dx)
        .dy(self.dy)
    }
}

extension SVG_Standard.PaintServers.LinearGradient: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .id(self.id)
            .x1(self.x1)
            .y1(self.y1)
            .x2(self.x2)
            .y2(self.y2)
            .href(self.href)
            .gradientUnits(self.gradientUnits?.rawValue)
            .gradientTransform(self.gradientTransform)
            .spreadMethod(self.spreadMethod?.rawValue)
    }
}

extension SVG_Standard.PaintServers.RadialGradient: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .id(self.id)
            .cx(self.cx)
            .cy(self.cy)
            .r(self.r)
            .fx(self.fx)
            .fy(self.fy)
            .fr(self.fr)
            .href(self.href)
            .gradientUnits(self.gradientUnits?.rawValue)
            .gradientTransform(self.gradientTransform)
            .spreadMethod(self.spreadMethod?.rawValue)
    }
}

extension SVG_Standard.PaintServers.Stop: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .offset(self.offset)
            .stopColor(self.stopColor)
            .stopOpacity(self.stopOpacity)
    }
}

extension SVG_Standard.PaintServers.Pattern: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .id(self.id)
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
            .viewBox(self.viewBox?.description)
            .href(self.href)
            .patternUnits(self.patternUnits?.rawValue)
            .patternContentUnits(self.patternContentUnits?.rawValue)
            .patternTransform(self.patternTransform)
            .preserveAspectRatio(self.preserveAspectRatio)
    }
}

extension SVG_Standard.Painting.ClipPath: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .id(self.id)
            .clipPathUnits(self.clipPathUnits?.rawValue)
    }
}

extension SVG_Standard.Painting.Mask: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .id(self.id)
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
            .maskUnits(self.maskUnits?.rawValue)
            .maskContentUnits(self.maskContentUnits?.rawValue)
    }
}

extension SVG_Standard.Painting.Marker: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .id(self.id)
            .viewBox(self.viewBox?.description)
            .refX(self.refX)
            .refY(self.refY)
            .markerWidth(self.markerWidth)
            .markerHeight(self.markerHeight)
            .orient(self.orient)
            .markerUnits(self.markerUnits?.rawValue)
            .preserveAspectRatio(self.preserveAspectRatio)
    }
}

extension SVG_Standard.Embedded.Image: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
            .href(self.href)
            .preserveAspectRatio(self.preserveAspectRatio)
    }
}

extension SVG_Standard.Embedded.ForeignObject: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
            .x(self.x)
            .y(self.y)
            .width(self.width)
            .height(self.height)
    }
}

extension SVG_Standard.Scripting.Switch: SVG.View {
    public var body: some SVG.View {
        SVG.Element(tag: Self.tagName) { SVG.Empty() }
    }
}
