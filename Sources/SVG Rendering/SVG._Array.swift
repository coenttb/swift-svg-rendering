//
//  SVG._Array.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

public import Rendering

// Extend the _Array type from Rendering module to conform to SVG.View
// Note: _Array is a top-level type exported from the Rendering module.
// Users can access it as _Array<Content> directly, not through SVG._Array.
extension _Array: SVG.View where Element: SVG.View {}
