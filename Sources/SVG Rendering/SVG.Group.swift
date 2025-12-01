//
//  SVG.Group.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

/// A container that groups multiple SVG elements together.
///
/// `SVG.Group` allows you to compose multiple SVG elements without
/// adding any additional rendering structure. It's useful for
/// returning multiple elements from computed properties or functions.
///
/// Example:
/// ```swift
/// var icons: some SVG.View {
///     SVG.Group {
///         circle(cx: 10, cy: 10, r: 5)
///         rect(x: 20, y: 20, width: 10, height: 10)
///     }
/// }
/// ```
extension SVG {
    public struct Group<Content: SVG.View>: SVG.View {
        /// The content of the group.
        let content: Content

        /// Creates a group with the given content.
        ///
        /// - Parameter content: A closure that returns the SVG content.
        public init(@SVG.Builder _ content: () -> Content) {
            self.content = content()
        }

        /// The body of the group is its content.
        public var body: some SVG.View {
            content
        }
    }
}
