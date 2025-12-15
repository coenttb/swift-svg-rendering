//
//  String+SVG.swift
//  swift-svg-rendering
//
//  String conformance to SVG.View for text content in SVG builders.
//

/// Allows String to be used directly in SVG builders.
///
/// Example:
/// ```swift
/// text(x: 10, y: 30) { "Hello, SVG!" }
/// tspan { "Some text" }
/// ```
extension String: SVG.View {
    public var body: some SVG.View {
        SVG.Text(self)
    }
}
