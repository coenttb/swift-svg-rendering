//
//  SVGRenderableTests.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

import SVG_Standard
import Testing

@testable import SVG_Rendering

@Suite("SVG Renderable Tests")
struct SVGRenderableTests {
    @Test("Empty renders to empty bytes")
    func emptyRendersEmpty() {
        let empty = SVG.Empty()
        let bytes = [UInt8](empty)
        #expect(bytes.isEmpty)
    }

    @Test("Text escapes special characters")
    func textEscapesSpecialChars() throws {
        let text = SVG.Text("<script>alert('xss')</script>")
        let string = try String(text)
        #expect(string.contains("&lt;"))
        #expect(string.contains("&gt;"))
        #expect(string.contains("&apos;"))
        #expect(!string.contains("<script>"))
    }

    @Test("Raw does not escape")
    func rawDoesNotEscape() throws {
        let raw = SVG.Raw("<circle cx=\"50\" cy=\"50\" r=\"40\"/>")
        let string = try String(raw)
        #expect(string == "<circle cx=\"50\" cy=\"50\" r=\"40\"/>")
    }

    @Test("Group composes elements")
    func groupComposes() throws {
        let group = SVG.Group {
            SVG.Text("Hello")
            SVG.Text(" ")
            SVG.Text("World")
        }
        let string = try String(group)
        #expect(string == "Hello World")
    }

    @Test("Circle element renders with attributes")
    func circleRenders() throws {
        let circle = SVG_Standard.Shapes.Circle(cx: 50, cy: 50, r: 40)()
        let string = try String(circle)
        #expect(string.contains("<circle"))
        #expect(string.contains("cx=\"50\""))
        #expect(string.contains("cy=\"50\""))
        #expect(string.contains("r=\"40\""))
        #expect(string.contains("</circle>"))
    }

    @Test("Rectangle element renders with attributes")
    func rectRenders() throws {
        let rect = SVG_Standard.Shapes.Rectangle(x: 10, y: 20, width: 100, height: 50)()
        let string = try String(rect)
        #expect(string.contains("<rect"))
        #expect(string.contains("x=\"10\""))
        #expect(string.contains("y=\"20\""))
        #expect(string.contains("width=\"100\""))
        #expect(string.contains("height=\"50\""))
        #expect(string.contains("</rect>"))
    }

    @Test("SVG element renders with viewBox")
    func svgRenders() throws {
        let svg = SVG_Standard.Document.SVG(
            width: .number(200),
            height: .number(100),
            viewBox: SVG_Standard.Types.ViewBox(minX: 0, minY: 0, width: 200, height: 100)
        )()
        let string = try String(svg)
        #expect(string.contains("<svg"))
        #expect(string.contains("width=\"200\""))
        #expect(string.contains("height=\"100\""))
        #expect(string.contains("viewBox=\"0 0 200 100\""))
        #expect(string.contains("</svg>"))
    }

    @Test("Element with method chaining for presentation attributes")
    func elementWithPresentationAttributes() throws {
        let circle = SVG_Standard.Shapes.Circle(cx: 50, cy: 50, r: 40)()
            .fill("red")
            .stroke("black")
            .strokeWidth(2)
        let string = try String(circle)
        #expect(string.contains("fill=\"red\""))
        #expect(string.contains("stroke=\"black\""))
        #expect(string.contains("stroke-width=\"2\""))
    }

    @Test("Nested elements render correctly")
    func nestedElements() throws {
        let svg = SVG_Standard.Document.SVG(width: .number(100), height: .number(100)) {
            SVG_Standard.Shapes.Circle(cx: 50, cy: 50, r: 40)()
                .fill("blue")
        }
        let string = try String(svg)
        #expect(string.contains("<svg"))
        #expect(string.contains("<circle"))
        #expect(string.contains("fill=\"blue\""))
        #expect(string.contains("</circle>"))
        #expect(string.contains("</svg>"))
    }
}
