// swift-tools-version: 6.2

import PackageDescription

extension String {
    static let svgRendering = "SVG Rendering"
}

extension Target.Dependency {
    static let svgRendering: Self = .target(name: .svgRendering)
}

extension Target.Dependency {
    static let renderable: Self = .product(name: "Rendering", package: "swift-renderable")
    static let renderableAsync: Self = .product(name: "RenderingAsync", package: "swift-renderable")
    static let svgStandard: Self = .product(name: "SVG Standard", package: "swift-svg-standard")
    static let orderedCollections: Self = .product(
        name: "OrderedCollections",
        package: "swift-collections"
    )
    static let dependencies: Self = .product(name: "Dependencies", package: "swift-dependencies")
    static let incits4_1986: Self = .product(name: "INCITS 4 1986", package: "swift-incits-4-1986")
    static let formatting: Self = .product(name: "Formatting", package: "swift-standards")
    static let dimension: Self = .product(name: "Dimension", package: "swift-standards")
}

let package = Package(
    name: "swift-svg-rendering",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
    ],
    products: [
        .library(name: .svgRendering, targets: [.svgRendering])
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-renderable", from: "3.2.0"),
        .package(url: "https://github.com/swift-standards/swift-svg-standard", from: "0.1.0"),
        .package(url: "https://github.com/swift-standards/swift-standards",from: "0.1.0"),
        .package(url: "https://github.com/swift-standards/swift-incits-4-1986", from: "0.1.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.1.0"),
    ],
    targets: [
        .target(
            name: .svgRendering,
            dependencies: [
                .renderable,
                .renderableAsync,
                .svgStandard,
                .incits4_1986,
                .formatting,
                .dimension,
                .orderedCollections,
            ]
        ),
        .testTarget(
            name: .svgRendering.tests,
            dependencies: [
                .svgRendering
            ]
        ),
    ]
)

extension String {
    var tests: Self { self + " Tests" }
}

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    let existing = target.swiftSettings ?? []
    target.swiftSettings =
        existing + [
            .enableUpcomingFeature("ExistentialAny"),
            .enableUpcomingFeature("InternalImportsByDefault"),
            .enableUpcomingFeature("MemberImportVisibility"),
        ]
}
