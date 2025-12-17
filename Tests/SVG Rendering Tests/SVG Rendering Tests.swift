//
//  SVG Rendering Tests.swift
//  swift-svg-rendering
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

import InlineSnapshotTesting
import SVG_Standard
import Testing

@testable import SVG_Rendering

// MARK: - SVG Renderable Snapshot Tests

@Suite("SVG Renderable Tests", .snapshots(record: .missing))
struct SVGRenderableTests {

    @Test("Empty renders to empty bytes")
    func emptyRendersEmpty() {
        let empty = SVG.Empty()
        let bytes = [UInt8](empty)
        #expect(bytes.isEmpty)
    }

    @Test("Text escapes special characters")
    func textEscapesSpecialChars() {
        let text = SVG.Text("<script>alert('xss')</script>")
        assertInlineSnapshot(of: String(text), as: .lines) {
            """
            &lt;script&gt;alert(&apos;xss&apos;)&lt;/script&gt;
            """
        }
    }

    @Test("Raw does not escape")
    func rawDoesNotEscape() {
        let raw = SVG.Raw("<circle cx=\"50\" cy=\"50\" r=\"40\"/>")
        assertInlineSnapshot(of: String(raw), as: .lines) {
            """
            <circle cx="50" cy="50" r="40"/>
            """
        }
    }

    @Test("Group composes elements")
    func groupComposes() {
        let group = SVG.Group {
            SVG.Text("Hello")
            SVG.Text(" ")
            SVG.Text("World")
        }
        assertInlineSnapshot(of: String(group), as: .lines) {
            """
            Hello World
            """
        }
    }

    @Test("Circle element renders with attributes")
    func circleRenders() {
        let circle = SVG_Standard.Shapes.Circle(cx: 50, cy: 50, r: 40)()
        assertInlineSnapshot(of: String(circle), as: .lines) {
            """
            <circle r="40" cy="50" cx="50"></circle>
            """
        }
    }

    @Test("Rectangle element renders with attributes")
    func rectRenders() {
        let rect = SVG_Standard.Shapes.Rectangle(x: 10, y: 20, width: 100, height: 50)()
        assertInlineSnapshot(of: String(rect), as: .lines) {
            """
            <rect height="50" width="100" y="20" x="10"></rect>
            """
        }
    }

    @Test("SVG element renders with viewBox")
    func svgRenders() {
        let svg = SVG_Standard.Document.SVG(
            width: .number(200),
            height: .number(100),
            viewBox: SVG_Standard.Types.ViewBox(minX: 0, minY: 0, width: 200, height: 100)
        )()
        assertInlineSnapshot(of: String(svg), as: .lines) {
            """
            <svg viewBox="0 0 200 100" height="100" width="200"></svg>
            """
        }
    }

    @Test("Element with method chaining for presentation attributes")
    func elementWithPresentationAttributes() {
        let circle = SVG_Standard.Shapes.Circle(cx: 50, cy: 50, r: 40)()
            .fill("red")
            .stroke("black")
            .strokeWidth(2)
        assertInlineSnapshot(of: String(circle), as: .lines) {
            """
            <circle stroke-width="2" stroke="black" fill="red" r="40" cy="50" cx="50"></circle>
            """
        }
    }

    @Test("Nested elements render correctly")
    func nestedElements() {
        let svg = SVG_Standard.Document.SVG(width: .number(100), height: .number(100)) {
            SVG_Standard.Shapes.Circle(cx: 50, cy: 50, r: 40)()
                .fill("blue")
        }
        assertInlineSnapshot(of: String(svg), as: .lines) {
            """
            <svg height="100" width="100"><circle fill="blue" r="40" cy="50" cx="50"></circle></svg>
            """
        }
    }
}

// MARK: - Circle Geometry + SVG Context Snapshot Tests

@Suite("Circle Math + SVG Context Tests", .snapshots(record: .missing))
struct CircleMathAndSVGContextTests {

    // MARK: - Math operations that return new geometry

    @Test("Circle math translation returns new geometry, then renders via .svg")
    func circleMathTranslationThenSVG() {
        // Start with a circle at origin
        let circle = W3C_SVG2.Circle(cx: 0, cy: 0, r: 25)

        // Apply MATH translation (returns new geometry with updated coordinates)
        let translated = circle.translated(by: W3C_SVG2.Vector(dx: 50, dy: 50))

        // Render using .svg context
        assertInlineSnapshot(of: String(translated.svg), as: .lines) {
            """
            <circle r="25" cy="50" cx="50"></circle>
            """
        }
    }

    @Test("Circle math scaling returns new geometry with larger radius")
    func circleMathScalingThenSVG() {
        // Start with a unit circle
        let circle = W3C_SVG2.Circle(cx: 0, cy: 0, r: 10)

        // Apply MATH scaling (returns new geometry with scaled radius)
        let scaled = circle.scaled(by: 2.0)

        // Render using .svg context
        assertInlineSnapshot(of: String(scaled.svg), as: .lines) {
            """
            <circle r="20" cy="0" cx="0"></circle>
            """
        }
    }

    @Test("Circle math scale about point moves center and scales radius")
    func circleMathScaleAboutPointThenSVG() {
        // Circle at (10, 0) with radius 5
        let circle = W3C_SVG2.Circle(cx: 10, cy: 0, r: 5)

        // Scale by 2 about origin - center moves to (20, 0), radius becomes 10
        let scaled = circle.scaled(by: 2.0, about: W3C_SVG2.Point(x: 0, y: 0))

        assertInlineSnapshot(of: String(scaled.svg), as: .lines) {
            """
            <circle r="10" cy="0" cx="20"></circle>
            """
        }
    }

    // MARK: - SVG context operations that add transform attributes

    @Test("Circle .svg.translated adds SVG transform attribute")
    func circleSVGTranslate() {
        let circle = W3C_SVG2.Circle(cx: 25, cy: 25, r: 20)

        // Use .svg context's translated - adds transform attribute (doesn't change cx/cy)
        let view = circle.svg.translated(by: W3C_SVG2.Vector(dx: 50, dy: 50))

        assertInlineSnapshot(of: String(view), as: .lines) {
            """
            <circle transform="translate(50, 50)" r="20" cy="25" cx="25"></circle>
            """
        }
    }

    @Test("Circle .svg.scaled adds SVG scale transform")
    func circleSVGScale() {
        let circle = W3C_SVG2.Circle(cx: 25, cy: 25, r: 10)

        // Use .svg context's scaled - adds transform attribute
        let view = circle.svg.scaled(by: 2.0)

        assertInlineSnapshot(of: String(view), as: .lines) {
            """
            <circle transform="scale(2)" r="10" cy="25" cx="25"></circle>
            """
        }
    }

    @Test("Circle .svg.rotated adds SVG rotate transform")
    func circleSVGRotate() {
        let circle = W3C_SVG2.Circle(cx: 50, cy: 0, r: 10)

        // Use .svg context's rotated
        let view = circle.svg.rotated(by: W3C_SVG2.Degrees(45))

        assertInlineSnapshot(of: String(view), as: .lines) {
            """
            <circle transform="rotate(45)" r="10" cy="0" cx="50"></circle>
            """
        }
    }

    @Test("Circle .svg.rotated around center point")
    func circleSVGRotateAroundCenter() {
        let circle = W3C_SVG2.Circle(cx: 100, cy: 0, r: 10)

        // Rotate 90 degrees around origin
        let view = circle.svg.rotated(
            by: W3C_SVG2.Degrees(90),
            around: W3C_SVG2.Point(x: 0, y: 0)
        )

        assertInlineSnapshot(of: String(view), as: .lines) {
            """
            <circle transform="rotate(90, 0, 0)" r="10" cy="0" cx="100"></circle>
            """
        }
    }

    // MARK: - Mixing math operations with SVG context

    @Test("Math translation then SVG rotation")
    func mathTranslationThenSVGRotation() {
        // Start with circle at origin
        let circle = W3C_SVG2.Circle(cx: 0, cy: 0, r: 15)

        // First: MATH translation (modifies geometry)
        let translated = circle.translated(by: W3C_SVG2.Vector(dx: 50, dy: 50))

        // Then: SVG rotation (adds transform attribute)
        let view = translated.svg.rotated(by: W3C_SVG2.Degrees(45))

        assertInlineSnapshot(of: String(view), as: .lines) {
            """
            <circle transform="rotate(45)" r="15" cy="50" cx="50"></circle>
            """
        }
    }

    @Test("Math scaling then SVG translation")
    func mathScalingThenSVGTranslation() {
        // Circle at origin with radius 10
        let circle = W3C_SVG2.Circle(cx: 0, cy: 0, r: 10)

        // First: MATH scaling (triples the radius)
        let scaled = circle.scaled(by: 3.0)

        // Then: SVG translation (adds transform, doesn't modify geometry)
        let view = scaled.svg.translated(by: W3C_SVG2.Vector(dx: 100, dy: 100))

        assertInlineSnapshot(of: String(view), as: .lines) {
            """
            <circle transform="translate(100, 100)" r="30" cy="0" cx="0"></circle>
            """
        }
    }

    @Test("Chained math operations then SVG context")
    func chainedMathThenSVG() {
        // Start at origin
        let circle = W3C_SVG2.Circle(cx: 0, cy: 0, r: 5)

        // Chain math operations: scale then translate
        let transformed = circle
            .scaled(by: 2.0)  // r becomes 10
            .translated(by: W3C_SVG2.Vector(dx: 25, dy: 25))  // center moves to (25, 25)

        // Then render with SVG scale transform
        let view = transformed.svg.scaled(by: 1.5)

        assertInlineSnapshot(of: String(view), as: .lines) {
            """
            <circle transform="scale(1.5)" r="10" cy="25" cx="25"></circle>
            """
        }
    }

    @Test("Circle with fill after math and SVG transforms")
    func circleWithStylesAfterTransforms() {
        let circle = W3C_SVG2.Circle(cx: 0, cy: 0, r: 20)

        // Math operation
        let translated = circle.translated(by: W3C_SVG2.Vector(dx: 50, dy: 50))

        // SVG rotation + styling
        let view = translated.svg
            .rotated(by: W3C_SVG2.Degrees(30))
            .fill("red")
            .stroke("black")
            .strokeWidth(2)

        assertInlineSnapshot(of: String(view), as: .lines) {
            """
            <circle stroke-width="2" stroke="black" fill="red" transform="rotate(30)" r="20" cy="50" cx="50"></circle>
            """
        }
    }

    // MARK: - Geometry properties verification

    @Test("Verify circle area after math scaling")
    func verifyAreaAfterScaling() {
        let circle = W3C_SVG2.Circle(cx: 0, cy: 0, r: 10)

        // Scale by 2 - area should quadruple
        let scaled = circle.scaled(by: 2.0)

        // Verify the math
        let originalArea = circle.area
        let scaledArea = scaled.area

        // Area scales by square of scale factor
        #expect(scaledArea._rawValue / originalArea._rawValue - 4.0 < 0.001)

        // Verify rendering
        assertInlineSnapshot(of: String(scaled.svg), as: .lines) {
            """
            <circle r="20" cy="0" cx="0"></circle>
            """
        }
    }

    @Test("Verify bounding box after math translation")
    func verifyBoundingBoxAfterTranslation() {
        let circle = W3C_SVG2.Circle(cx: 0, cy: 0, r: 10)
        let translated = circle.translated(by: W3C_SVG2.Vector(dx: 50, dy: 50))

        let bbox = translated.boundingBox

        // Bounding box should be centered at (50, 50) with extent of radius
        #expect(bbox.llx._rawValue - 40.0 < 0.001)
        #expect(bbox.lly._rawValue - 40.0 < 0.001)
        #expect(bbox.urx._rawValue - 60.0 < 0.001)
        #expect(bbox.ury._rawValue - 60.0 < 0.001)

        // Verify rendering
        assertInlineSnapshot(of: String(translated.svg), as: .lines) {
            """
            <circle r="10" cy="50" cx="50"></circle>
            """
        }
    }
}

// MARK: - SVG Document Snapshot Tests

@Suite("SVG Document Tests", .snapshots(record: .missing))
struct SVGDocumentTests {

    @Test("Complete SVG document with multiple shapes")
    func completeDocument() {
        let svg = SVG_Standard.Document.SVG(
            width: .number(200),
            height: .number(200),
            viewBox: SVG_Standard.Types.ViewBox(minX: 0, minY: 0, width: 200, height: 200)
        ) {
            SVG_Standard.Shapes.Circle(cx: 100, cy: 100, r: 50)()
                .fill("blue")
                .stroke("black")
                .strokeWidth(2)
            SVG_Standard.Shapes.Rectangle(x: 25, y: 25, width: 50, height: 50)()
                .fill("red")
        }

        assertInlineSnapshot(of: String(svg), as: .lines) {
            """
            <svg viewBox="0 0 200 200" height="200" width="200"><circle stroke-width="2" stroke="black" fill="blue" r="50" cy="100" cx="100"></circle><rect fill="red" height="50" width="50" y="25" x="25"></rect></svg>
            """
        }
    }

    @Test("SVG with geometry types directly")
    func geometryTypesInDocument() {
        let circle = W3C_SVG2.Circle(cx: 50, cy: 50, r: 30)
        let scaledCircle = circle.scaled(by: 1.5)

        let svg = SVG_Standard.Document.SVG(
            width: .number(200),
            height: .number(200)
        ) {
            scaledCircle.svg.fill("green")
        }

        assertInlineSnapshot(of: String(svg), as: .lines) {
            """
            <svg height="200" width="200"><circle fill="green" r="45" cy="50" cx="50"></circle></svg>
            """
        }
    }
}
