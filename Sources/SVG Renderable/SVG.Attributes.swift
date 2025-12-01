//
//  SVG.Attributes.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp
//

import Numeric_Formatting

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
    public func rotate(_ angle: Double, cx: Double? = nil, cy: Double? = nil) -> SVG._Attributes<Self> {
        if let cx = cx, let cy = cy {
            return attribute("transform", "rotate(\(angle.formatted(.number)), \(cx.formatted(.number)), \(cy.formatted(.number)))")
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
