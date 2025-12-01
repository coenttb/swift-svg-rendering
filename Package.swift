// swift-tools-version: 6.2

import PackageDescription

extension String {
    static let svgRendering = "SVG Rendering"
}

extension Target.Dependency {
    static let svgRendering: Self = .target(name: .svgRendering)
}

extension Target.Dependency {
    static let renderable: Self = .product(name: "Renderable", package: "swift-renderable")
    static let svgStandard: Self = .product(name: "SVG Standard", package: "swift-svg-standard")
    static let orderedCollections: Self = .product(
        name: "OrderedCollections",
        package: "swift-collections"
    )
    static let dependencies: Self = .product(name: "Dependencies", package: "swift-dependencies")
    static let incits4_1986: Self = .product(name: "INCITS 4 1986", package: "swift-incits-4-1986")
    static let numericFormatting: Self = .product(
        name: "Numeric Formatting",
        package: "swift-numeric-formatting-standard"
    )
}

let package = Package(
    name: "swift-svg-rendering",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11),
    ],
    products: [
        .library(name: .svgRendering, targets: [.svgRendering])
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-renderable", from: "3.0.0"),
        .package(url: "https://github.com/swift-standards/swift-svg-standard", from: "0.1.0"),
        .package(
            url: "https://github.com/swift-standards/swift-numeric-formatting-standard",
            from: "0.1.0"
        ),
        .package(url: "https://github.com/swift-standards/swift-incits-4-1986", from: "0.1.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.1.0"),
    ],
    targets: [
        .target(
            name: .svgRendering,
            dependencies: [
                .renderable,
                .svgStandard,
                .incits4_1986,
                .numericFormatting,
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
