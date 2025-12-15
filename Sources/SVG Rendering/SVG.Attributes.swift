//
//  SVG.Attributes.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp
//

import Formatting

// MARK: - Presentation Attributes

extension SVG.View {
    /// Sets the fill color of the SVG element.
    public func fill(_ color: String) -> SVG._Attributes<Self> {
        attribute("fill", color)
    }

    /// Sets the stroke color of the SVG element.
    public func stroke(_ color: String) -> SVG._Attributes<Self> {
        attribute("stroke", color)
    }

    /// Sets the stroke color and width of the SVG element.
    public func stroke(_ color: String, width: Double) -> SVG._Attributes<Self> {
        attribute("stroke", color)
            .attribute("stroke-width", width.formatted(.number))
    }

    /// Sets the stroke width of the SVG element.
    public func strokeWidth(_ width: Double) -> SVG._Attributes<Self> {
        attribute("stroke-width", width.formatted(.number))
    }

    /// Sets the opacity of the SVG element.
    public func opacity(_ value: Double) -> SVG._Attributes<Self> {
        attribute("opacity", value.formatted(.number))
    }

    /// Sets the fill opacity of the SVG element.
    public func fillOpacity(_ value: Double) -> SVG._Attributes<Self> {
        attribute("fill-opacity", value.formatted(.number))
    }

    /// Sets the stroke opacity of the SVG element.
    public func strokeOpacity(_ value: Double) -> SVG._Attributes<Self> {
        attribute("stroke-opacity", value.formatted(.number))
    }

    /// Sets the stroke line cap of the SVG element.
    public func strokeLinecap(_ value: String) -> SVG._Attributes<Self> {
        attribute("stroke-linecap", value)
    }

    /// Sets the stroke line join of the SVG element.
    public func strokeLinejoin(_ value: String) -> SVG._Attributes<Self> {
        attribute("stroke-linejoin", value)
    }

    /// Sets the stroke dash array of the SVG element.
    public func strokeDasharray(_ value: String) -> SVG._Attributes<Self> {
        attribute("stroke-dasharray", value)
    }

    /// Sets the stroke dash offset of the SVG element.
    public func strokeDashoffset(_ value: Double) -> SVG._Attributes<Self> {
        attribute("stroke-dashoffset", value.formatted(.number))
    }

    /// Sets the fill rule of the SVG element.
    public func fillRule(_ value: String) -> SVG._Attributes<Self> {
        attribute("fill-rule", value)
    }
}

// MARK: - Transform Attributes

extension SVG.View {
    /// Sets the transform attribute of the SVG element.
    public func transform(_ value: String) -> SVG._Attributes<Self> {
        attribute("transform", value)
    }

    /// Applies a translation transform to the SVG element.
    public func translate(x: Double = 0, y: Double = 0) -> SVG._Attributes<Self> {
        attribute("transform", "translate(\(x.formatted(.number)), \(y.formatted(.number)))")
    }

    /// Applies a rotation transform to the SVG element.
    public func rotate(
        _ angle: Double,
        cx: Double? = nil,
        cy: Double? = nil
    ) -> SVG._Attributes<Self> {
        if let cx = cx, let cy = cy {
            return attribute(
                "transform",
                "rotate(\(angle.formatted(.number)), \(cx.formatted(.number)), \(cy.formatted(.number)))"
            )
        }
        return attribute("transform", "rotate(\(angle.formatted(.number)))")
    }

    /// Applies a scale transform to the SVG element.
    public func scale(x: Double, y: Double? = nil) -> SVG._Attributes<Self> {
        if let y = y {
            return attribute("transform", "scale(\(x.formatted(.number)), \(y.formatted(.number)))")
        }
        return attribute("transform", "scale(\(x.formatted(.number)))")
    }

    /// Applies a skewX transform to the SVG element.
    public func skewX(_ angle: Double) -> SVG._Attributes<Self> {
        attribute("transform", "skewX(\(angle.formatted(.number)))")
    }

    /// Applies a skewY transform to the SVG element.
    public func skewY(_ angle: Double) -> SVG._Attributes<Self> {
        attribute("transform", "skewY(\(angle.formatted(.number)))")
    }
}

// MARK: - Common Attributes

extension SVG.View {
    /// Sets the id attribute of the SVG element.
    public func id(_ value: String) -> SVG._Attributes<Self> {
        attribute("id", value)
    }

    /// Sets the class attribute of the SVG element.
    public func `class`(_ value: String) -> SVG._Attributes<Self> {
        attribute("class", value)
    }

    /// Sets the style attribute of the SVG element.
    public func style(_ value: String) -> SVG._Attributes<Self> {
        attribute("style", value)
    }

    /// Sets the clip-path attribute of the SVG element.
    public func clipPath(_ value: String) -> SVG._Attributes<Self> {
        attribute("clip-path", value)
    }

    /// Sets the mask attribute of the SVG element.
    public func mask(_ value: String) -> SVG._Attributes<Self> {
        attribute("mask", value)
    }

    /// Sets the filter attribute of the SVG element.
    public func filter(_ value: String) -> SVG._Attributes<Self> {
        attribute("filter", value)
    }
}

// MARK: - Text Attributes

extension SVG.View {
    /// Sets the font-family attribute of the SVG element.
    public func fontFamily(_ value: String) -> SVG._Attributes<Self> {
        attribute("font-family", value)
    }

    /// Sets the font-size attribute of the SVG element.
    public func fontSize(_ value: Double) -> SVG._Attributes<Self> {
        attribute("font-size", value.formatted(.number))
    }

    /// Sets the font-size attribute of the SVG element with a string value.
    public func fontSize(_ value: String) -> SVG._Attributes<Self> {
        attribute("font-size", value)
    }

    /// Sets the font-weight attribute of the SVG element.
    public func fontWeight(_ value: String) -> SVG._Attributes<Self> {
        attribute("font-weight", value)
    }

    /// Sets the font-style attribute of the SVG element.
    public func fontStyle(_ value: String) -> SVG._Attributes<Self> {
        attribute("font-style", value)
    }

    /// Sets the text-anchor attribute of the SVG element.
    public func textAnchor(_ value: String) -> SVG._Attributes<Self> {
        attribute("text-anchor", value)
    }

    /// Sets the dominant-baseline attribute of the SVG element.
    public func dominantBaseline(_ value: String) -> SVG._Attributes<Self> {
        attribute("dominant-baseline", value)
    }
}

// MARK: - Marker Attributes

extension SVG.View {
    /// Sets the marker-start attribute of the SVG element.
    public func markerStart(_ value: String) -> SVG._Attributes<Self> {
        attribute("marker-start", value)
    }

    /// Sets the marker-mid attribute of the SVG element.
    public func markerMid(_ value: String) -> SVG._Attributes<Self> {
        attribute("marker-mid", value)
    }

    /// Sets the marker-end attribute of the SVG element.
    public func markerEnd(_ value: String) -> SVG._Attributes<Self> {
        attribute("marker-end", value)
    }
}

// MARK: - Geometry Attributes (Shapes)

extension SVG.View {
    /// Sets the cx attribute (center x-coordinate).
    public func cx(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("cx", value.formatted(.number))
    }

    /// Sets the cy attribute (center y-coordinate).
    public func cy(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("cy", value.formatted(.number))
    }

    /// Sets the r attribute (radius).
    public func r(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("r", value.formatted(.number))
    }

    /// Sets the r attribute (radius) as a string.
    public func r(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("r", value)
    }

    /// Sets the rx attribute (x-axis radius).
    public func rx(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("rx", value.formatted(.number))
    }

    /// Sets the ry attribute (y-axis radius).
    public func ry(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("ry", value.formatted(.number))
    }

    /// Sets the x attribute.
    public func x(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("x", value.formatted(.number))
    }

    /// Sets the x attribute as a string (for lengths with units).
    public func x(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("x", value)
    }

    /// Sets the y attribute.
    public func y(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("y", value.formatted(.number))
    }

    /// Sets the y attribute as a string (for lengths with units).
    public func y(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("y", value)
    }

    /// Sets the width attribute.
    public func width(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("width", value.formatted(.number))
    }

    /// Sets the width attribute as a string (for lengths with units).
    public func width(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("width", value)
    }

    /// Sets the height attribute.
    public func height(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("height", value.formatted(.number))
    }

    /// Sets the height attribute as a string (for lengths with units).
    public func height(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("height", value)
    }

    /// Sets the x1 attribute (line start x-coordinate).
    public func x1(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("x1", value.formatted(.number))
    }

    /// Sets the x1 attribute as a string.
    public func x1(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("x1", value)
    }

    /// Sets the y1 attribute (line start y-coordinate).
    public func y1(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("y1", value.formatted(.number))
    }

    /// Sets the y1 attribute as a string.
    public func y1(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("y1", value)
    }

    /// Sets the x2 attribute (line end x-coordinate).
    public func x2(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("x2", value.formatted(.number))
    }

    /// Sets the x2 attribute as a string.
    public func x2(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("x2", value)
    }

    /// Sets the y2 attribute (line end y-coordinate).
    public func y2(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("y2", value.formatted(.number))
    }

    /// Sets the y2 attribute as a string.
    public func y2(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("y2", value)
    }

    /// Sets the points attribute (for polygon/polyline).
    public func points(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("points", value)
    }

    /// Sets the d attribute (path data).
    public func d(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("d", value)
    }

    /// Sets the pathLength attribute.
    public func pathLength(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("pathLength", value.formatted(.number))
    }
}

// MARK: - Viewport Attributes

extension SVG.View {
    /// Sets the viewBox attribute.
    public func viewBox(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("viewBox", value)
    }

    /// Sets the viewBox attribute from individual values.
    public func viewBox(minX: Double, minY: Double, width: Double, height: Double) -> SVG._Attributes<Self> {
        attribute("viewBox", "\(minX.formatted(.number)) \(minY.formatted(.number)) \(width.formatted(.number)) \(height.formatted(.number))")
    }

    /// Sets the preserveAspectRatio attribute.
    public func preserveAspectRatio(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("preserveAspectRatio", value)
    }

    /// Sets the xmlns attribute.
    public func xmlns(_ value: String) -> SVG._Attributes<Self> {
        attribute("xmlns", value)
    }
}

// MARK: - Reference Attributes

extension SVG.View {
    /// Sets the href attribute.
    public func href(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("href", value)
    }

    /// Sets the xlink:href attribute (legacy).
    public func xlinkHref(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("xlink:href", value)
    }

    /// Sets the target attribute.
    public func target(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("target", value)
    }

    /// Sets the download attribute.
    public func download(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("download", value)
    }

    /// Sets the rel attribute.
    public func rel(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("rel", value)
    }

    /// Sets the hreflang attribute.
    public func hreflang(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("hreflang", value)
    }

    /// Sets the type attribute.
    public func type(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("type", value)
    }
}

// MARK: - Gradient Attributes

extension SVG.View {
    /// Sets the gradientUnits attribute.
    public func gradientUnits(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("gradientUnits", value)
    }

    /// Sets the gradientTransform attribute.
    public func gradientTransform(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("gradientTransform", value)
    }

    /// Sets the spreadMethod attribute.
    public func spreadMethod(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("spreadMethod", value)
    }

    /// Sets the offset attribute (for gradient stops).
    public func offset(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("offset", value)
    }

    /// Sets the stop-color attribute.
    public func stopColor(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("stop-color", value)
    }

    /// Sets the stop-opacity attribute.
    public func stopOpacity(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("stop-opacity", value.formatted(.number))
    }

    /// Sets the fx attribute (radial gradient focal point x).
    public func fx(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("fx", value)
    }

    /// Sets the fy attribute (radial gradient focal point y).
    public func fy(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("fy", value)
    }

    /// Sets the fr attribute (radial gradient focal radius).
    public func fr(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("fr", value)
    }
}

// MARK: - Pattern Attributes

extension SVG.View {
    /// Sets the patternUnits attribute.
    public func patternUnits(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("patternUnits", value)
    }

    /// Sets the patternContentUnits attribute.
    public func patternContentUnits(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("patternContentUnits", value)
    }

    /// Sets the patternTransform attribute.
    public func patternTransform(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("patternTransform", value)
    }
}

// MARK: - Clipping and Masking Attributes

extension SVG.View {
    /// Sets the clipPathUnits attribute.
    public func clipPathUnits(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("clipPathUnits", value)
    }

    /// Sets the maskUnits attribute.
    public func maskUnits(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("maskUnits", value)
    }

    /// Sets the maskContentUnits attribute.
    public func maskContentUnits(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("maskContentUnits", value)
    }
}

// MARK: - Marker Element Attributes

extension SVG.View {
    /// Sets the refX attribute.
    public func refX(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("refX", value.formatted(.number))
    }

    /// Sets the refX attribute as a string.
    public func refX(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("refX", value)
    }

    /// Sets the refY attribute.
    public func refY(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("refY", value.formatted(.number))
    }

    /// Sets the refY attribute as a string.
    public func refY(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("refY", value)
    }

    /// Sets the markerWidth attribute.
    public func markerWidth(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("markerWidth", value.formatted(.number))
    }

    /// Sets the markerHeight attribute.
    public func markerHeight(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("markerHeight", value.formatted(.number))
    }

    /// Sets the markerUnits attribute.
    public func markerUnits(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("markerUnits", value)
    }

    /// Sets the orient attribute.
    public func orient(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("orient", value)
    }
}

// MARK: - Text Element Attributes

extension SVG.View {
    /// Sets the dx attribute (text offset x).
    public func dx(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("dx", value.formatted(.number))
    }

    /// Sets the dx attribute as a string.
    public func dx(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("dx", value)
    }

    /// Sets the dy attribute (text offset y).
    public func dy(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("dy", value.formatted(.number))
    }

    /// Sets the dy attribute as a string.
    public func dy(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("dy", value)
    }

    /// Sets the textLength attribute.
    public func textLength(_ value: Double?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("textLength", value.formatted(.number))
    }

    /// Sets the textLength attribute as a string.
    public func textLength(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("textLength", value)
    }

    /// Sets the lengthAdjust attribute.
    public func lengthAdjust(_ value: String?) -> SVG._Attributes<Self> {
        guard let value else { return SVG._Attributes(content: self, attributes: [:]) }
        return attribute("lengthAdjust", value)
    }
}
