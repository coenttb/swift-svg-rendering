// swift-tools-version: 6.4

import PackageDescription

extension String {
    static let svgRendering: Self = "SVG Rendering"
    var tests: Self { self + " Tests" }
}

extension Target.Dependency {
    static var svgRendering: Self { .target(name: .svgRendering) }
}

extension Target.Dependency {
    static var rendering: Self {
        .product(name: "Render", package: "swift-render")
    }
    static var svgStandard: Self {
        .product(name: "SVG Standard", package: "swift-svg-standard")
    }
    static var ascii: Self {
        .product(name: "ASCII", package: "swift-ascii")
    }
    static var formatting: Self {
        .product(name: "Format", package: "swift-format")
    }
    static var dimension: Self {
        .product(name: "Dimension", package: "swift-dimension")
    }
    static var dictionary: Self {
        .product(name: "Dictionary", package: "swift-dictionary")
    }
    static var sharedPrimitive: Self {
        .product(name: "Ownership Shared Primitive", package: "swift-ownership-shared")
    }
    static var hashIndexedPrimitive: Self {
        .product(name: "Hash Indexed Primitive", package: "swift-hash-table")
    }
    static var column: Self {
        .product(name: "Column", package: "swift-column")
    }
    static var hash: Self {
        .product(name: "Hash", package: "swift-hash")
    }
    static var bufferLinearPrimitive: Self {
        .product(name: "Buffer Linear Primitive", package: "swift-buffer-linear")
    }
}

let package = Package(
    name: "swift-svg-render",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: .svgRendering, targets: [.svgRendering]),
        .library(name: "SVG Rendering Test Support", targets: ["SVG Rendering Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-render.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-standards/swift-svg-standard.git", branch: "main"),
        .package(
            url: "https://github.com/swift-molecules/swift-format.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-dimension.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-ascii.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-dictionary.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-dictionary-ordered.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-ownership-shared.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-hash-table.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-column.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-hash.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-buffer-linear.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: .svgRendering,
            dependencies: [
                .rendering,
                .svgStandard,
                .ascii,
                .formatting,
                .dimension,
                .dictionary,
                .product(
                    name: "Dictionary Ordered",
                    package: "swift-dictionary-ordered"
                ),
                .sharedPrimitive,
                .hashIndexedPrimitive,
                .column,
                .hash,
                .bufferLinearPrimitive,
            ]
        ),
        .target(
            name: "SVG Rendering Test Support",
            dependencies: [
                .svgRendering,
                .product(
                    name: "Dimension Test Support",
                    package: "swift-dimension"
                ),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: .svgRendering.tests,
            dependencies: [
                .svgRendering,
                "SVG Rendering Test Support",
            ],
            path: "Tests/SVG Rendering Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
