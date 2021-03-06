// swift-tools-version:5.1
import PackageDescription

let buildCommit = "8d50049"

let package = Package(
    name: "Xash3D",
    products: [
        // iOS support
        .library(
            name: "Xash3D",
            type: .static,
            targets: [
                "Xash3D",
            ]
        ),
        // macOS and Linux
        .executable(
            name: "xash3d",
            targets: ["GameLauncher"]
        ),
        .library(
            name: "xash",
            type: .dynamic,
            targets: ["Xash3D"]
        ),
        .library(
            name: "menu",
            type: .dynamic,
            targets: ["UserInterface"]
        ),
        /*
        .library(
            name: "ref_soft",
            type: .dynamic,
            targets: ["SoftwareGL"]
        ),
        .library(
            name: "ref_gl",
            type: .dynamic,
            targets: ["HardwareGL"]
        )*/
    ],
    dependencies: [
        /*
        .package(
            url: "https://github.com/MillerTechnologyPeru/hlsdk-xash3d.git",
            .branch("feature/swiftpm")
        )*/
    ],
    targets: [
        .target(
            name: "Xash3D",
            dependencies: [
                "CSDL2"
            ],
            cSettings: [
                .define("XASH_BUILD_COMMIT", to: "\"\(buildCommit)\""),
                .define("HAVE_TGMATH_H", to: "1"),
                .define("HAVE_STDINT_H", to: "1"),
                .define("STDINT_H", to: "\"stdint.h\""),
                .define("XASH_LOW_MEMORY", to: "0"),
                .define("HAVE_SDL2", to: "1"),
                .define("XASH_SDL", to: "2"),
                //.define("XASH_64BIT", to: "1"),
                .define("_THREAD_SAFE")
            ]
        ),
        .target(
            name: "GameLauncher",
            dependencies: [
                "Xash3D",
                "CSDL2"
            ],
            cSettings: [
                .define("XASH_BUILD_COMMIT", to: "\"\(buildCommit)\""),
                .define("HAVE_TGMATH_H", to: "1"),
                .define("HAVE_STDINT_H", to: "1"),
                .define("STDINT_H", to: "\"stdint.h\""),
                .define("XASH_LOW_MEMORY", to: "0"),
                .headerSearchPath("./../Xash3D/include")
            ]
        ),
        .target(
            name: "NanoGL"
        ),
        .target(
            name: "SoftwareGL",
            cSettings: [
                .define("XASH_BUILD_COMMIT", to: "\"\(buildCommit)\""),
                .define("REF_DLL"),
                .define("HAVE_TGMATH_H", to: "1"),
                .define("HAVE_STDINT_H", to: "1"),
                .define("STDINT_H", to: "\"stdint.h\""),
                .define("XASH_LOW_MEMORY", to: "0"),
                .headerSearchPath("./"),
                .headerSearchPath("./../Xash3D/include")
            ]
        ),
        .systemLibrary(
            name: "CSDL2",
            pkgConfig: "sdl2",
            providers: [
                .brew(["sdl2"]),
                .apt(["libsdl2-dev"])
            ]
        ),
        .target(
            name: "UserInterface",
            dependencies: [
            ],
            cSettings: [
                .define("XASH_BUILD_COMMIT", to: "\"\(buildCommit)\""),
                .define("HAVE_TGMATH_H", to: "1"),
                .define("HAVE_STDINT_H", to: "1"),
                .define("STDINT_H", to: "\"stdint.h\""),
                .define("XASH_LOW_MEMORY", to: "0"),
                .headerSearchPath("./../Xash3D/include"),
                .headerSearchPath("./"),
                .headerSearchPath("./controls"),
                .headerSearchPath("./font"),
                .headerSearchPath("./menus"),
                .headerSearchPath("./miniutl"),
                .headerSearchPath("./model"),
            ]
        )
    ],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx11
)
