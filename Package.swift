// swift-tools-version: 6.2

import PackageDescription

extension String {
    static let svgRenderable = "SVG Renderable"
}

extension Target.Dependency {
    static let svgRenderable: Self = .target(name: .svgRenderable)
}

extension Target.Dependency {
    static let renderable: Self = .product(name: "Renderable", package: "swift-renderable")
    static let svgStandard: Self = .product(name: "SVG Standard", package: "swift-svg-standard")
    static let orderedCollections: Self = .product(name: "OrderedCollections", package: "swift-collections")
    static let dependencies: Self = .product(name: "Dependencies", package: "swift-dependencies")
}

let package = Package(
    name: "swift-svg-renderable",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11),
    ],
    products: [
        .library(name: .svgRenderable, targets: [.svgRenderable]),
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-renderable.git", from: "0.1.0"),
        .package(url: "https://github.com/swift-standards/swift-svg-standard.git", from: "0.1.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.1.0"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: .svgRenderable,
            dependencies: [
                .renderable,
                .svgStandard,
                .orderedCollections,
                .dependencies,
            ]
        ),
        .testTarget(
            name: "SVG Renderable Tests",
            dependencies: [
                .svgRenderable,
            ]
        ),
    ]
)

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("StrictUnsafe"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
]

for index in package.targets.indices {
    package.targets[index].swiftSettings = (package.targets[index].swiftSettings ?? []) + swiftSettings
}
