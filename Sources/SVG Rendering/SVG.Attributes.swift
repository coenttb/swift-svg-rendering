import Format
public import SVG_Standard

extension SVG.View {

    public func fill(_ color: String) -> SVG._Attributes<Self> {
        attribute("fill", color)
    }

    public func stroke(_ color: String) -> SVG._Attributes<Self> {
        attribute("stroke", color)
    }

    public func stroke(_ color: String?, width: Double?) -> SVG._Attributes<Self> {
        attribute("stroke", color)
            .attribute("stroke-width", width?.formatted(.number))
    }

    public func strokeWidth(_ width: Double?) -> SVG._Attributes<Self> {
        attribute("stroke-width", width?.formatted(.number))
    }

    public func opacity(_ value: Double?) -> SVG._Attributes<Self> {
        attribute("opacity", value)
    }

    public func fillOpacity(_ value: Double?) -> SVG._Attributes<Self> {
        attribute("fill-opacity", value)
    }

    public func strokeOpacity(_ value: Double?) -> SVG._Attributes<Self> {
        attribute("stroke-opacity", value)
    }

    public func strokeLinecap(_ value: String) -> SVG._Attributes<Self> {
        attribute("stroke-linecap", value)
    }

    public func strokeLinejoin(_ value: String) -> SVG._Attributes<Self> {
        attribute("stroke-linejoin", value)
    }

    public func strokeDasharray(_ value: String) -> SVG._Attributes<Self> {
        attribute("stroke-dasharray", value)
    }

    public func strokeDashoffset(_ value: Double?) -> SVG._Attributes<Self> {
        attribute("stroke-dashoffset", value)
    }

    public func fillRule(_ value: String) -> SVG._Attributes<Self> {
        attribute("fill-rule", value)
    }
}

extension SVG.View {

    public func transform(_ value: String) -> SVG._Attributes<Self> {
        attribute("transform", value)
    }

    public func translate(x: Double = 0, y: Double = 0) -> SVG._Attributes<Self> {
        attribute("transform", "translate(\(x.formatted(.number)), \(y.formatted(.number)))")
    }

    public func rotate(
        _ angle: Double,
        cx: Double? = nil,
        cy: Double? = nil
    ) -> SVG._Attributes<Self> {
        if let cx, let cy {
            return attribute(
                "transform",
                "rotate(\(angle.formatted(.number)), \(cx.formatted(.number)), \(cy.formatted(.number)))"
            )
        }
        return attribute("transform", "rotate(\(angle.formatted(.number)))")
    }

    public func scale(x: Double, y: Double? = nil) -> SVG._Attributes<Self> {
        if let y {
            return attribute("transform", "scale(\(x.formatted(.number)), \(y.formatted(.number)))")
        }
        return attribute("transform", "scale(\(x.formatted(.number)))")
    }

    public func skewX(
        _ angle: Double
    ) -> SVG._Attributes<Self> {
        attribute("transform", "skewX(\(angle.formatted(.number)))")
    }

    public func skewY(
        _ angle: Double
    ) -> SVG._Attributes<Self> {
        attribute("transform", "skewY(\(angle.formatted(.number)))")
    }
}

extension SVG.View {

    public func id(_ value: String) -> SVG._Attributes<Self> {
        attribute("id", value)
    }

    public func `class`(_ value: String) -> SVG._Attributes<Self> {
        attribute("class", value)
    }

    public func style(_ value: String) -> SVG._Attributes<Self> {
        attribute("style", value)
    }

    public func clipPath(_ value: String) -> SVG._Attributes<Self> {
        attribute("clip-path", value)
    }

    public func mask(_ value: String) -> SVG._Attributes<Self> {
        attribute("mask", value)
    }

    public func filter(_ value: String) -> SVG._Attributes<Self> {
        attribute("filter", value)
    }
}

extension SVG.View {

    public func fontFamily(_ value: String) -> SVG._Attributes<Self> {
        attribute("font-family", value)
    }

    public func fontSize(_ value: Double?) -> SVG._Attributes<Self> {
        attribute("font-size", value)
    }

    public func fontSize(_ value: String) -> SVG._Attributes<Self> {
        attribute("font-size", value)
    }

    public func fontWeight(_ value: String) -> SVG._Attributes<Self> {
        attribute("font-weight", value)
    }

    public func fontStyle(_ value: String) -> SVG._Attributes<Self> {
        attribute("font-style", value)
    }

    public func textAnchor(_ value: String) -> SVG._Attributes<Self> {
        attribute("text-anchor", value)
    }

    public func dominantBaseline(_ value: String) -> SVG._Attributes<Self> {
        attribute("dominant-baseline", value)
    }
}

extension SVG.View {

    public func markerStart(_ value: String) -> SVG._Attributes<Self> {
        attribute("marker-start", value)
    }

    public func markerMid(_ value: String) -> SVG._Attributes<Self> {
        attribute("marker-mid", value)
    }

    public func markerEnd(_ value: String) -> SVG._Attributes<Self> {
        attribute("marker-end", value)
    }
}

extension SVG.View {

    public func cx(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("cx", value)
    }

    public func cy(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("cy", value)
    }

    public func r(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("r", value)
    }

    public func r(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("r", value)
    }

    public func rx(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("rx", value)
    }

    public func ry(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("ry", value)
    }

    public func x(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("x", value)
    }

    public func x(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("x", value)
    }

    public func y(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("y", value)
    }

    public func y(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("y", value)
    }

    public func width(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("width", value)
    }

    public func width(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("width", value)
    }

    public func height(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("height", value)
    }

    public func height(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("height", value)
    }

    public func x1(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("x1", value)
    }

    public func x1(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("x1", value)
    }

    public func y1(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("y1", value)
    }

    public func y1(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("y1", value)
    }

    public func x2(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("x2", value)
    }

    public func x2(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("x2", value)
    }

    public func y2(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("y2", value)
    }

    public func y2(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("y2", value)
    }

    public func points(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("points", value)
    }

    public func d(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("d", value)
    }

    public func pathLength(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("pathLength", value)
    }
}

extension SVG.View {

    public func viewBox(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("viewBox", value)
    }

    public func viewBox(
        minX: Double,
        minY: Double,
        width: Double,
        height: Double
    ) -> SVG._Attributes<Self> {
        attribute(
            "viewBox",
            "\(minX.formatted(.number)) \(minY.formatted(.number)) \(width.formatted(.number)) \(height.formatted(.number))"
        )
    }

    public func preserveAspectRatio(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("preserveAspectRatio", value)
    }

    public func xmlns(_ value: String) -> SVG._Attributes<Self> {
        attribute("xmlns", value)
    }
}

extension SVG.View {

    public func href(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("href", value)
    }

    public func xlinkHref(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("xlink:href", value)
    }

    public func target(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("target", value)
    }

    public func download(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("download", value)
    }

    public func rel(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("rel", value)
    }

    public func hreflang(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("hreflang", value)
    }

    public func type(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("type", value)
    }
}

extension SVG.View {

    public func gradientUnits(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("gradientUnits", value)
    }

    public func gradientTransform(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("gradientTransform", value)
    }

    public func spreadMethod(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("spreadMethod", value)
    }

    public func offset(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("offset", value)
    }

    public func stopColor(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("stop-color", value)
    }

    public func stopOpacity(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("stop-opacity", value)
    }

    public func fx(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("fx", value)
    }

    public func fy(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("fy", value)
    }

    public func fr(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("fr", value)
    }
}

extension SVG.View {

    public func patternUnits(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("patternUnits", value)
    }

    public func patternContentUnits(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("patternContentUnits", value)
    }

    public func patternTransform(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("patternTransform", value)
    }
}

extension SVG.View {

    public func clipPathUnits(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("clipPathUnits", value)
    }

    public func maskUnits(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("maskUnits", value)
    }

    public func maskContentUnits(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("maskContentUnits", value)
    }
}

extension SVG.View {

    public func refX(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("refX", value)
    }

    public func refX(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("refX", value)
    }

    public func refY(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("refY", value)
    }

    public func refY(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("refY", value)
    }

    public func markerWidth(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("markerWidth", value)
    }

    public func markerHeight(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("markerHeight", value)
    }

    public func markerUnits(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("markerUnits", value)
    }

    public func orient(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("orient", value)
    }
}

extension SVG.View {

    public func dx(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("dx", value)
    }

    public func dx(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("dx", value)
    }

    public func dy(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("dy", value)
    }

    public func dy(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("dy", value)
    }

    public func textLength(_ value: Double?) -> SVG._Attributes<Self> {
        return attribute("textLength", value)
    }

    public func textLength(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("textLength", value)
    }

    public func lengthAdjust(_ value: String?) -> SVG._Attributes<Self> {
        return attribute("lengthAdjust", value)
    }
}

extension SVG.View {

    public func x(_ value: W3C_SVG2.X?) -> SVG._Attributes<Self> {
        return attribute("x", value)
    }

    public func y(_ value: W3C_SVG2.Y?) -> SVG._Attributes<Self> {
        return attribute("y", value)
    }

    public func width(_ value: W3C_SVG2.Width?) -> SVG._Attributes<Self> {
        return attribute("width", value)
    }

    public func height(_ value: W3C_SVG2.Height?) -> SVG._Attributes<Self> {
        return attribute("height", value)
    }

    public func cx(_ value: W3C_SVG2.X?) -> SVG._Attributes<Self> {
        return attribute("cx", value)
    }

    public func cy(_ value: W3C_SVG2.Y?) -> SVG._Attributes<Self> {
        return attribute("cy", value)
    }

    public func r(_ value: W3C_SVG2.Radius?) -> SVG._Attributes<Self> {
        return attribute("r", value)
    }

    public func rx(_ value: W3C_SVG2.Width?) -> SVG._Attributes<Self> {
        return attribute("rx", value)
    }

    public func ry(_ value: W3C_SVG2.Height?) -> SVG._Attributes<Self> {
        return attribute("ry", value)
    }

    public func x1(_ value: W3C_SVG2.X?) -> SVG._Attributes<Self> {
        return attribute("x1", value)
    }

    public func y1(_ value: W3C_SVG2.Y?) -> SVG._Attributes<Self> {
        return attribute("y1", value)
    }

    public func x2(_ value: W3C_SVG2.X?) -> SVG._Attributes<Self> {
        return attribute("x2", value)
    }

    public func y2(_ value: W3C_SVG2.Y?) -> SVG._Attributes<Self> {
        return attribute("y2", value)
    }

    public func dx(_ value: W3C_SVG2.Dx?) -> SVG._Attributes<Self> {
        return attribute("dx", value)
    }

    public func dy(_ value: W3C_SVG2.Dy?) -> SVG._Attributes<Self> {
        return attribute("dy", value)
    }

    public func refX(_ value: W3C_SVG2.X?) -> SVG._Attributes<Self> {
        return attribute("refX", value)
    }

    public func refY(_ value: W3C_SVG2.Y?) -> SVG._Attributes<Self> {
        return attribute("refY", value)
    }

    public func markerWidth(_ value: W3C_SVG2.Width?) -> SVG._Attributes<Self> {
        return attribute("markerWidth", value)
    }

    public func markerHeight(_ value: W3C_SVG2.Height?) -> SVG._Attributes<Self> {
        return attribute("markerHeight", value)
    }
}
