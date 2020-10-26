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
                "bower.json",
                "conformance",
                "java",
                "js",
                "rb",
                "README.md",
                "unicode_regex",
                "objc/resources",
                "objc/ThirdParty/IFUnicodeURL/Resources",
                "objc/ThirdParty/IFUnicodeURL/IFUnicodeURL-LICENSE.txt",
                "objc/tests",
                "objc/Rakefile",
                "objc/LICENSE",
                "objc/CHANGELOG.md",
                "objc/README.md",
                "objc/twitter-text.podspec",
                "objc/ThirdParty/IFUnicodeURL/Tests",
                "objc/ThirdParty/IFUnicodeURL/README.txt",
                "config/README.md",
                "LICENSE"
            ],
            sources: [
                "objc/lib",
                "objc/ThirdParty/IFUnicodeURL/IFUnicodeURL/"
            ],
            resources: [
                .copy("config/v1.json"),
                .copy("config/v2.json"),
                .copy("config/v3.json")
            ],
            publicHeadersPath: "objc/include",
            cSettings: [
                .headerSearchPath("objc/ThirdParty/IFUnicodeURL/IFUnicodeURL/")
            ]
        ),

        .testTarget(
            name: "TwitterTextTests",
            dependencies: ["TwitterText"],
            path: "objc/tests",
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
