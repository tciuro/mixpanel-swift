// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Mixpanel",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11),
        .macOS(.v10_13),
        .watchOS(.v4)
    ],
    products: [
        .library(name: "Mixpanel", targets: ["Mixpanel"])
    ],
    dependencies: [
        .package(url: "https://github.com/sbooth/CSQLite", .upToNextMajor(from: "3.45.3"))
    ],
    targets: [
        .target(
            name: "Mixpanel",
            path: "Sources",
            resources: [
                .copy("Mixpanel/PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
