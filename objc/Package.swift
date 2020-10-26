// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TwitterText",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v9),
        .tvOS(.v12),
        .watchOS(.v4)
    ],
    products: [
        .library(name: "TwitterText", type: .dynamic, targets: ["TwitterText"]),
    ],
    targets: [
        .target(
            name: "TwitterText",
            path: "",
            exclude: [
                "CHANGELOG.md",
                "LICENSE",
                "resources",
                "README.md",
                "Rakefile",
                "twitter-text.podspec",
                "tests",
                "ThirdParty/IFUnicodeURL/README.txt",
                "ThirdParty/IFUnicodeURL/Resources",
                "ThirdParty/IFUnicodeURL/Tests",
                "ThirdParty/IFUnicodeURL/IFUnicodeURL-LICENSE.txt",
                "config/BUILD",
                "config/README.md"
            ],
            sources: [
                "lib",
                "ThirdParty/IFUnicodeURL/IFUnicodeURL/"
            ],
            resources: [
                .copy("config/v1.json"),
                .copy("config/v2.json"),
                .copy("config/v3.json")
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("ThirdParty/IFUnicodeURL/IFUnicodeURL/")
            ]
        ),

        .testTarget(
            name: "TwitterTextTests",
            dependencies: ["TwitterText"],
            path: "tests",
            exclude: [
                "json-conformance",
                "resources"
            ],
            cSettings: [
                .headerSearchPath("../lib")
            ]
        )
    ]
)
