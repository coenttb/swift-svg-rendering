import Dictionary_Ordered
import Format
public import SVG_Standard

extension SVG_Standard.Shapes.Circle {

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

    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .points(self.points)
    }
}

extension SVG_Standard.Shapes.Polyline {

    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .points(self.points)
    }
}

extension SVG_Standard.Paths.Path {

    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .d(self.d)
            .fillRule(self.fillRule?.rawValue)
    }
}

extension SVG_Standard.Document.SVG {

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

    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .id(self.id)
    }
}

extension SVG_Standard.Document.Defs {

    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
    }
}

extension SVG_Standard.Document.Symbol {

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

extension SVG_Standard.Text.Text {

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

extension SVG_Standard.PaintServers.LinearGradient {

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

extension SVG_Standard.Painting.ClipPath {

    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
            .id(self.id)
            .clipPathUnits(self.clipPathUnits?.rawValue)
    }
}

extension SVG_Standard.Painting.Mask {

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

extension SVG_Standard.Embedded.Image {

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

extension SVG_Standard.Scripting.Switch {

    public func callAsFunction<Content: SVG.View>(
        @SVG.Builder _ content: () -> Content = { SVG.Empty() }
    ) -> some SVG.View {
        SVG.Element(tag: Self.tagName) { content() }
    }
}

extension SVG.View {

    func id(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: .init()) }
        return attribute("id", value)
    }

    func fillRule(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: .init()) }
        return attribute("fill-rule", value)
    }

    func cx(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: .init()) }
        return attribute("cx", value)
    }

    func cy(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: .init()) }
        return attribute("cy", value)
    }
}

extension Geometry.Ball: SVG.View where Scalar == Double, Space == W3C_SVG.Space, N == 2 {
    public var body: some SVG.View {
        svg
    }
}

extension Geometry.Orthotope: SVG.View where Scalar == Double, Space == W3C_SVG.Space, N == 2 {
    public var body: some SVG.View {
        svg
    }
}

extension Geometry.Ellipse: SVG.View where Scalar == Double, Space == W3C_SVG.Space {
    public var body: some SVG.View {
        svg
    }
}

extension Geometry.Line.Segment: SVG.View where Scalar == Double, Space == W3C_SVG.Space {
    public var body: some SVG.View {
        svg
    }
}

extension Geometry.Polygon: SVG.View where Scalar == Double, Space == W3C_SVG.Space {
    public var body: some SVG.View {
        svg
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
