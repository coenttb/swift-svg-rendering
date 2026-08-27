import Dictionary_Ordered
import Format
public import SVG_Standard

extension Geometry.Ball.SVGContext: SVG.View
where Scalar == Double, Space == W3C_SVG.Space, N == 2 {
    public var body: some SVG.View {
        SVG.Element(tag: "circle") { SVG.Empty() }
            .cx(circle.cx)
            .cy(circle.cy)
            .r(circle.r)
    }

    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx.underlying, y: vector.dy.underlying)
    }

    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    public func scaled(x: Double, y: Double) -> some SVG.View {
        self.scale(x: x, y: y)
    }

    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle.underlying)
    }

    public func rotated(by angle: W3C_SVG2.Degrees, around center: W3C_SVG2.Point) -> some SVG.View
    {
        self.rotate(angle.underlying, cx: center.x.underlying, cy: center.y.underlying)
    }
}

extension Geometry.Orthotope.SVGContext: SVG.View
where Scalar == Double, Space == W3C_SVG.Space, N == 2 {
    public var body: some SVG.View {
        SVG.Element(tag: "rect") { SVG.Empty() }
            .x(rectangle.x)
            .y(rectangle.y)
            .width(rectangle.width)
            .height(rectangle.height)
    }

    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx.underlying, y: vector.dy.underlying)
    }

    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    public func scaled(x: Double, y: Double) -> some SVG.View {
        self.scale(x: x, y: y)
    }

    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle.underlying)
    }

    public func rotated(by angle: W3C_SVG2.Degrees, around center: W3C_SVG2.Point) -> some SVG.View
    {
        self.rotate(angle.underlying, cx: center.x.underlying, cy: center.y.underlying)
    }

    public func rx(_ value: W3C_SVG2.Width) -> some SVG.View {
        SVG._Attributes(content: self, attributes: .init()).rx(value)
    }

    public func ry(_ value: W3C_SVG2.Height) -> some SVG.View {
        SVG._Attributes(content: self, attributes: .init()).ry(value)
    }
}

extension Geometry.Ellipse.SVGContext: SVG.View
where Scalar == Double, Space == W3C_SVG.Space {
    public var body: some SVG.View {
        SVG.Element(tag: "ellipse") { SVG.Empty() }
            .cx(ellipse.center.x)
            .cy(ellipse.center.y)
            .rx(W3C_SVG2.Width(ellipse.semiMajor.underlying))
            .ry(W3C_SVG2.Height(ellipse.semiMinor.underlying))
    }

    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx.underlying, y: vector.dy.underlying)
    }

    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle.underlying)
    }
}

extension Geometry.Line.Segment.SVGContext: SVG.View
where Scalar == Double, Space == W3C_SVG.Space {
    public var body: some SVG.View {
        let el = element
        return SVG.Element(tag: "line") { SVG.Empty() }
            .x1(el.x1)
            .y1(el.y1)
            .x2(el.x2)
            .y2(el.y2)
    }

    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx.underlying, y: vector.dy.underlying)
    }

    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle.underlying)
    }
}

extension Geometry.Polygon.SVGContext: SVG.View
where Scalar == Double, Space == W3C_SVG.Space {
    public var body: some SVG.View {
        let el = element
        return SVG.Element(tag: "polygon") { SVG.Empty() }
            .points(el.points)
    }

    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx.underlying, y: vector.dy.underlying)
    }

    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle.underlying)
    }
}

extension Geometry.Path.SVGContext: SVG.View
where Scalar == Double, Space == W3C_SVG.Space {
    public var body: some SVG.View {
        let el = element
        return SVG.Element(tag: "path") { SVG.Empty() }
            .d(el.d)
    }

    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx.underlying, y: vector.dy.underlying)
    }

    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle.underlying)
    }
}
