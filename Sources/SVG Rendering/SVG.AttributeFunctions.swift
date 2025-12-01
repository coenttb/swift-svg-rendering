//
//  SVG.AttributeFunctions.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp
//
//  Global functions that create attribute-only SVG views.
//  These can be used within SVG builders to add attributes to parent elements.

import Numeric_Formatting
import OrderedCollections

// MARK: - Presentation Attribute Functions

/// Creates an SVG attribute for fill color.
public func fill(_ color: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["fill": color])
}

/// Creates an SVG attribute for stroke color.
public func stroke(_ color: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["stroke": color])
}

/// Creates an SVG attribute for stroke color and width.
public func stroke(_ color: String, width: Double) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(
        content: SVG.Empty(),
        attributes: ["stroke": color, "stroke-width": width.formatted(.number)]
    )
}

/// Creates an SVG attribute for stroke width.
public func strokeWidth(_ width: Double) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["stroke-width": width.formatted(.number)])
}

/// Creates an SVG attribute for opacity.
public func opacity(_ value: Double) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["opacity": value.formatted(.number)])
}

/// Creates an SVG attribute for fill opacity.
public func fillOpacity(_ value: Double) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["fill-opacity": value.formatted(.number)])
}

/// Creates an SVG attribute for stroke opacity.
public func strokeOpacity(_ value: Double) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["stroke-opacity": value.formatted(.number)])
}

/// Creates an SVG attribute for stroke line cap.
public func strokeLinecap(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["stroke-linecap": value])
}

/// Creates an SVG attribute for stroke line join.
public func strokeLinejoin(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["stroke-linejoin": value])
}

/// Creates an SVG attribute for stroke dash array.
public func strokeDasharray(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["stroke-dasharray": value])
}

/// Creates an SVG attribute for stroke dash offset.
public func strokeDashoffset(_ value: Double) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(
        content: SVG.Empty(),
        attributes: ["stroke-dashoffset": value.formatted(.number)]
    )
}

/// Creates an SVG attribute for fill rule.
public func fillRule(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["fill-rule": value])
}

// MARK: - Transform Attribute Functions

/// Creates an SVG transform attribute.
public func transform(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["transform": value])
}

/// Creates an SVG translate transform attribute.
public func translate(x: Double = 0, y: Double = 0) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(
        content: SVG.Empty(),
        attributes: ["transform": "translate(\(x.formatted(.number)), \(y.formatted(.number)))"]
    )
}

/// Creates an SVG rotate transform attribute.
public func rotate(
    _ angle: Double,
    cx: Double? = nil,
    cy: Double? = nil
) -> SVG._Attributes<SVG.Empty> {
    if let cx = cx, let cy = cy {
        return SVG._Attributes(
            content: SVG.Empty(),
            attributes: [
                "transform":
                    "rotate(\(angle.formatted(.number)), \(cx.formatted(.number)), \(cy.formatted(.number)))"
            ]
        )
    }
    return SVG._Attributes(
        content: SVG.Empty(),
        attributes: ["transform": "rotate(\(angle.formatted(.number)))"]
    )
}

/// Creates an SVG scale transform attribute.
public func scale(x: Double, y: Double? = nil) -> SVG._Attributes<SVG.Empty> {
    if let y = y {
        return SVG._Attributes(
            content: SVG.Empty(),
            attributes: ["transform": "scale(\(x.formatted(.number)), \(y.formatted(.number)))"]
        )
    }
    return SVG._Attributes(
        content: SVG.Empty(),
        attributes: ["transform": "scale(\(x.formatted(.number)))"]
    )
}

/// Creates an SVG skewX transform attribute.
public func skewX(_ angle: Double) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(
        content: SVG.Empty(),
        attributes: ["transform": "skewX(\(angle.formatted(.number)))"]
    )
}

/// Creates an SVG skewY transform attribute.
public func skewY(_ angle: Double) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(
        content: SVG.Empty(),
        attributes: ["transform": "skewY(\(angle.formatted(.number)))"]
    )
}

// MARK: - Text Attribute Functions

/// Creates an SVG attribute for font-family.
public func fontFamily(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["font-family": value])
}

/// Creates an SVG attribute for font-size with a numeric value.
public func fontSize(_ value: Double) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["font-size": value.formatted(.number)])
}

/// Creates an SVG attribute for font-size with an integer value.
public func fontSize(_ value: Int) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["font-size": String(value)])
}

/// Creates an SVG attribute for font-size with a string value.
public func fontSize(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["font-size": value])
}

/// Creates an SVG attribute for font-weight.
public func fontWeight(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["font-weight": value])
}

/// Creates an SVG attribute for font-style.
public func fontStyle(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["font-style": value])
}

/// Creates an SVG attribute for text-anchor.
public func textAnchor(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["text-anchor": value])
}

/// Creates an SVG attribute for dominant-baseline.
public func dominantBaseline(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["dominant-baseline": value])
}

// MARK: - Common Attribute Functions

/// Creates an SVG attribute for id.
public func id(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["id": value])
}

/// Creates an SVG attribute for class.
public func `class`(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["class": value])
}

/// Creates an SVG attribute for style.
public func style(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["style": value])
}

/// Creates an SVG attribute for clip-path.
public func clipPath(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["clip-path": value])
}

/// Creates an SVG attribute for mask.
public func mask(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["mask": value])
}

/// Creates an SVG attribute for filter.
public func filter(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["filter": value])
}

// MARK: - Marker Attribute Functions

/// Creates an SVG attribute for marker-start.
public func markerStart(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["marker-start": value])
}

/// Creates an SVG attribute for marker-mid.
public func markerMid(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["marker-mid": value])
}

/// Creates an SVG attribute for marker-end.
public func markerEnd(_ value: String) -> SVG._Attributes<SVG.Empty> {
    SVG._Attributes(content: SVG.Empty(), attributes: ["marker-end": value])
}
