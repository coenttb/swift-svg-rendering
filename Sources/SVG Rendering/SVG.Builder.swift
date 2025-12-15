//
//  SVG.Builder.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

import Rendering

public typealias RenderableBuilder = Builder

/// A result builder that enables declarative SVG construction with a SwiftUI-like syntax.
///
/// `SVG.Builder` provides a DSL for constructing SVG content in Swift code.
/// It transforms multiple statements in a closure into a single SVG value,
/// allowing for a natural, hierarchical representation of SVG structure.
///
/// Example:
/// ```swift
/// let icon = svg(width: 100, height: 100) {
///     circle(cx: 50, cy: 50, r: 40)
///     if showBorder {
///         rect(x: 0, y: 0, width: 100, height: 100)
///             .stroke("black")
///             .fill("none")
///     }
///     for point in points {
///         circle(cx: point.x, cy: point.y, r: 2)
///     }
/// }
/// ```
///
public typealias BuilderRaw = Builder

/// The `SVG.Builder` supports Swift language features like conditionals, loops,
/// and optional unwrapping within the SVG construction DSL.
extension SVG {
    public typealias Builder = BuilderRaw
}
