//
//  SVG.GeometryContext.swift
//  swift-svg-rendering
//
//  SVG.View conformances for geometry SVGContext wrappers.
//  All SVG rendering goes through .svg accessor, keeping geometry types pure math.
//

import Formatting
public import SVG_Standard

// MARK: - Circle SVGContext

extension Geometry.Ball.SVGContext: @retroactive Rendering.`Protocol`
where Scalar == Double, Space == W3C_SVG.Space, N == 2 {
    public typealias Context = SVG.Context
    public typealias Output = UInt8
}

extension Geometry.Ball.SVGContext: SVG.View
where Scalar == Double, Space == W3C_SVG.Space, N == 2 {
    public var body: some SVG.View {
        SVG.Element(tag: "circle") { SVG.Empty() }
            .cx(circle.cx)
            .cy(circle.cy)
            .r(circle.r)
    }

    /// Applies an SVG translate transform.
    ///
    /// Unlike `circle.translated(by:)` which returns a new circle with different coordinates,
    /// this method returns an SVG view with a `transform="translate(...)"` attribute.
    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx._rawValue, y: vector.dy._rawValue)
    }

    /// Applies an SVG scale transform.
    ///
    /// Unlike `circle.scaled(by:)` which returns a new circle with different radius,
    /// this method returns an SVG view with a `transform="scale(...)"` attribute.
    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    /// Applies an SVG scale transform with different x and y factors.
    public func scaled(x: Double, y: Double) -> some SVG.View {
        self.scale(x: x, y: y)
    }

    /// Applies an SVG rotate transform.
    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle._rawValue)
    }

    /// Applies an SVG rotate transform around a center point.
    public func rotated(by angle: W3C_SVG2.Degrees, around center: W3C_SVG2.Point) -> some SVG.View {
        self.rotate(angle._rawValue, cx: center.x._rawValue, cy: center.y._rawValue)
    }
}

// MARK: - Rectangle SVGContext

extension Geometry.Orthotope.SVGContext: @retroactive Rendering.`Protocol`
where Scalar == Double, Space == W3C_SVG.Space, N == 2 {
    public typealias Context = SVG.Context
    public typealias Output = UInt8
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

    /// Applies an SVG translate transform.
    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx._rawValue, y: vector.dy._rawValue)
    }

    /// Applies an SVG scale transform.
    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    /// Applies an SVG scale transform with different x and y factors.
    public func scaled(x: Double, y: Double) -> some SVG.View {
        self.scale(x: x, y: y)
    }

    /// Applies an SVG rotate transform.
    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle._rawValue)
    }

    /// Applies an SVG rotate transform around a center point.
    public func rotated(by angle: W3C_SVG2.Degrees, around center: W3C_SVG2.Point) -> some SVG.View {
        self.rotate(angle._rawValue, cx: center.x._rawValue, cy: center.y._rawValue)
    }

    /// Sets the rx attribute for rounded corners.
    public func rx(_ value: W3C_SVG2.Width) -> some SVG.View {
        SVG._Attributes(content: self, attributes: [:]).rx(value)
    }

    /// Sets the ry attribute for rounded corners.
    public func ry(_ value: W3C_SVG2.Height) -> some SVG.View {
        SVG._Attributes(content: self, attributes: [:]).ry(value)
    }
}

// MARK: - Ellipse SVGContext

extension Geometry.Ellipse.SVGContext: @retroactive Rendering.`Protocol`
where Scalar == Double, Space == W3C_SVG.Space {
    public typealias Context = SVG.Context
    public typealias Output = UInt8
}

extension Geometry.Ellipse.SVGContext: SVG.View
where Scalar == Double, Space == W3C_SVG.Space {
    public var body: some SVG.View {
        SVG.Element(tag: "ellipse") { SVG.Empty() }
            .cx(ellipse.center.x)
            .cy(ellipse.center.y)
            .rx(W3C_SVG2.Width(ellipse.semiMajor._rawValue))
            .ry(W3C_SVG2.Height(ellipse.semiMinor._rawValue))
    }

    /// Applies an SVG translate transform.
    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx._rawValue, y: vector.dy._rawValue)
    }

    /// Applies an SVG scale transform.
    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    /// Applies an SVG rotate transform.
    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle._rawValue)
    }
}

// MARK: - Line SVGContext

extension Geometry.Line.Segment.SVGContext: @retroactive Rendering.`Protocol`
where Scalar == Double, Space == W3C_SVG.Space {
    public typealias Context = SVG.Context
    public typealias Output = UInt8
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

    /// Applies an SVG translate transform.
    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx._rawValue, y: vector.dy._rawValue)
    }

    /// Applies an SVG scale transform.
    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    /// Applies an SVG rotate transform.
    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle._rawValue)
    }
}

// MARK: - Polygon SVGContext

extension Geometry.Polygon.SVGContext: @retroactive Rendering.`Protocol`
where Scalar == Double, Space == W3C_SVG.Space {
    public typealias Context = SVG.Context
    public typealias Output = UInt8
}

extension Geometry.Polygon.SVGContext: SVG.View
where Scalar == Double, Space == W3C_SVG.Space {
    public var body: some SVG.View {
        let el = element
        return SVG.Element(tag: "polygon") { SVG.Empty() }
            .points(el.points)
    }

    /// Applies an SVG translate transform.
    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx._rawValue, y: vector.dy._rawValue)
    }

    /// Applies an SVG scale transform.
    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    /// Applies an SVG rotate transform.
    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle._rawValue)
    }
}

// MARK: - Path SVGContext

extension Geometry.Path.SVGContext: @retroactive Rendering.`Protocol`
where Scalar == Double, Space == W3C_SVG.Space {
    public typealias Context = SVG.Context
    public typealias Output = UInt8
}

extension Geometry.Path.SVGContext: SVG.View
where Scalar == Double, Space == W3C_SVG.Space {
    public var body: some SVG.View {
        let el = element
        return SVG.Element(tag: "path") { SVG.Empty() }
            .d(el.d)
    }

    /// Applies an SVG translate transform.
    public func translated(by vector: W3C_SVG2.Vector) -> some SVG.View {
        self.translate(x: vector.dx._rawValue, y: vector.dy._rawValue)
    }

    /// Applies an SVG scale transform.
    public func scaled(by factor: Double) -> some SVG.View {
        self.scale(x: factor)
    }

    /// Applies an SVG rotate transform.
    public func rotated(by angle: W3C_SVG2.Degrees) -> some SVG.View {
        self.rotate(angle._rawValue)
    }
}
