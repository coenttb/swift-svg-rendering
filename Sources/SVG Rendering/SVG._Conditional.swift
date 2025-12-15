//
//  SVG._Conditional.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

public import Rendering

// Extend the _Conditional type from Rendering module to conform to SVG.View
// Note: _Conditional is a top-level type exported from the Rendering module.
// Users can access it as _Conditional<First, Second> directly, not through SVG._Conditional.
extension _Conditional: SVG.View where First: SVG.View, Second: SVG.View {}
