//
//  SVG.Builder.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

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
/// The `SVG.Builder` supports Swift language features like conditionals, loops,
/// and optional unwrapping within the SVG construction DSL.
extension SVG {
    @resultBuilder
    public enum Builder {
        /// Combines an array of components into a single SVG component.
        ///
        /// - Parameter components: An array of SVG components to combine.
        /// - Returns: A single SVG component representing the array of components.
        public static func buildArray<Element: SVG.View>(_ components: [Element]) -> SVG._Array<Element> {
            SVG._Array(elements: components)
        }

        /// Creates an empty SVG component when no content is provided.
        ///
        /// - Returns: An empty SVG component.
        public static func buildBlock() -> SVG.Empty {
            SVG.Empty()
        }

        /// Passes through a single content component unchanged.
        ///
        /// - Parameter content: The SVG component to pass through.
        /// - Returns: The same SVG component.
        public static func buildBlock<Content: SVG.View>(_ content: Content) -> Content {
            content
        }

        /// Combines multiple SVG components into a tuple of components.
        ///
        /// - Parameter content: The SVG components to combine.
        /// - Returns: A tuple of SVG components.
        public static func buildBlock<each Content: SVG.View>(
            _ content: repeat each Content
        ) -> SVG._Tuple<repeat each Content> {
            SVG._Tuple(content: repeat each content)
        }

        /// Handles the "if" or "true" case in a conditional statement.
        ///
        /// - Parameter component: The SVG component for the "if" or "true" case.
        /// - Returns: A conditional SVG component representing the "if" or "true" case.
        public static func buildEither<First: SVG.View, Second: SVG.View>(
            first component: First
        ) -> SVG._Conditional<First, Second> {
            .first(component)
        }

        /// Handles the "else" or "false" case in a conditional statement.
        ///
        /// - Parameter component: The SVG component for the "else" or "false" case.
        /// - Returns: A conditional SVG component representing the "else" or "false" case.
        public static func buildEither<First: SVG.View, Second: SVG.View>(
            second component: Second
        ) -> SVG._Conditional<First, Second> {
            .second(component)
        }

        /// Converts any SVG expression to itself.
        ///
        /// - Parameter expression: The SVG expression to convert.
        /// - Returns: The same SVG expression.
        public static func buildExpression<T: SVG.View>(_ expression: T) -> T {
            expression
        }

        /// Converts a text expression to SVG text.
        ///
        /// - Parameter expression: The SVG text to convert.
        /// - Returns: The same SVG text.
        public static func buildExpression(_ expression: SVG.Text) -> SVG.Text {
            expression
        }

        /// Handles optional SVG components.
        ///
        /// - Parameter component: An optional SVG component.
        /// - Returns: The same optional SVG component.
        public static func buildOptional<T: SVG.View>(_ component: T?) -> T? {
            component
        }

        /// Finalizes the result of the builder.
        ///
        /// - Parameter component: The SVG component to finalize.
        /// - Returns: The final SVG component.
        public static func buildFinalResult<T: SVG.View>(_ component: T) -> T {
            component
        }
    }
}
