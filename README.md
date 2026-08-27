# swift-svg-render

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Renders SVG documents to UTF-8 bytes or strings through a declarative result-builder DSL over W3C SVG Standard types.

---

## Key Features

- **Result-builder DSL** — compose documents from `SVG.View` values inside `@SVG.Builder` closures.
- **W3C SVG Standard types** — shapes, paths, gradients, patterns, masks, markers, text, and document elements render directly via `callAsFunction`.
- **Byte-oriented rendering** — render into any `RangeReplaceableCollection<UInt8>` with `[UInt8](view)`, or to a `String` with `String(view)`.
- **Automatic XML escaping** — text content and attribute values escape `&`, `<`, `>`, `"`, and `'`.
- **Attribute modifiers** — chain presentation, transform, text, and geometry attributes (`fill`, `stroke`, `transform`, `fontSize`, …).
- **Geometry integration** — `Geometry` / `W3C_SVG2` types conform to `SVG.View` and expose `.svg` for SVG transforms (`translated`, `scaled`, `rotated`).
- **Async rendering** — `await String(view)` and `await [UInt8](view)` yield to the scheduler for large documents.

---

## Quick Start

Compose a document from W3C SVG Standard types and render it to markup:

```swift
import SVG_Rendering
import SVG_Standard

let document = SVG_Standard.Document.SVG(
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

let markup = String(document)
// <svg viewBox="0 0 200 200" height="200" width="200"><circle stroke-width="2" stroke="black" fill="blue" r="50" cy="100" cx="100"></circle><rect fill="red" height="50" width="50" y="25" x="25"></rect></svg>
```

`SVG.Text` escapes special characters, while `SVG.Raw` emits markup verbatim, and `SVG.Group` composes fragments without introducing an enclosing element.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-compositions/swift-svg-render.git", branch: "main")
]
```

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "SVG Rendering", package: "swift-svg-render"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26.

---

## Architecture

Two library products.

| Product | Module | Purpose |
|---------|--------|---------|
| `SVG Rendering` | `SVG_Rendering` | The `SVG` namespace, the `SVG.View` DSL and `SVG.Builder`, attribute modifiers, byte/string rendering, and the `callAsFunction` / `SVG.View` conformances that render W3C SVG Standard element types. |
| `SVG Rendering Test Support` | `SVG_Rendering_Test_Support` | Re-exports for test consumers, including the SVG snapshot strategy. |

Importing `SVG Rendering` re-exports `SVG Standard`, `Render`, `Format`, `ASCII`, and `Dictionary`, so the element types and the result builder are available from the single import.

---

## Community

<!-- BEGIN: discussion -->
*Discussion thread will be created at first public release.*
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE](LICENSE.md).
