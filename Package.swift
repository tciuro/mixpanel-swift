// swift-tools-version:5.7

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
    targets: [
        .target(name: "CSQLite", cSettings: [
            // Derived from sqlite3 version 3.43.0
            .define("SQLITE_DQS", to: "0"),
            .define("SQLITE_ENABLE_API_ARMOR"),
            .define("SQLITE_ENABLE_COLUMN_METADATA"),
            .define("SQLITE_ENABLE_DBSTAT_VTAB"),
            .define("SQLITE_ENABLE_FTS3"),
            .define("SQLITE_ENABLE_FTS3_PARENTHESIS"),
            .define("SQLITE_ENABLE_FTS3_TOKENIZER"),
            .define("SQLITE_ENABLE_FTS4"),
            .define("SQLITE_ENABLE_FTS5"),
            .define("SQLITE_ENABLE_MEMORY_MANAGEMENT"),
            .define("SQLITE_ENABLE_PREUPDATE_HOOK"),
            .define("SQLITE_ENABLE_RTREE"),
            .define("SQLITE_ENABLE_SESSION"),
            .define("SQLITE_ENABLE_STMTVTAB"),
            .define("SQLITE_ENABLE_UNKNOWN_SQL_FUNCTION"),
            .define("SQLITE_ENABLE_UNLOCK_NOTIFY"),
            .define("SQLITE_MAX_VARIABLE_NUMBER", to: "250000"),
            .define("SQLITE_LIKE_DOESNT_MATCH_BLOBS"),
            .define("SQLITE_OMIT_DEPRECATED"),
            .define("SQLITE_OMIT_LOAD_EXTENSION"),
            .define("SQLITE_OMIT_SHARED_CACHE"),
            .define("SQLITE_SECURE_DELETE"),
            .define("SQLITE_THREADSAFE", to: "2"),
            .define("SQLITE_USE_URI"),
        ]),
        .target(
            name: "Mixpanel", dependencies: [
                .target(name: "CSQLite"),
            ],
            path: "Sources",
            resources: [
                .copy("Mixpanel/PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
