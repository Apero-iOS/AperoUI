// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AperoUI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
      ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AperoUI",
            targets: ["AperoUI"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.ßß
        .target(
            name: "AperoUI",
            resources: [
                    .process("ic_star.png"),
                    .process("ic_star_selected.png"),
                    .process("BlurViewController.xib"),
                    .process("RatingApp.xib"),
                ]),
        
//        .testTarget(
//            name: "AperoUITests",
//            dependencies: ["AperoUI"]),
        
    ]
    
)
