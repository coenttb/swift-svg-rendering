//
//  SVGRenderableTests.swift
//  swift-svg-renderable
//
//  Created by Coen ten Thije Boonkkamp on 26/11/2025.
//

import Testing
@testable import SVG_Renderable

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
}
