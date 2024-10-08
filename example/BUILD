load("//:defs.bzl", "pkg_msi")
load("@bazel_skylib//rules:build_test.bzl", "build_test")

cc_binary(
    name = "example",
    srcs = ["example.cc"],
)

pkg_msi(
    name = "rules_msi_example.msi",
    src = "example.wxs",
    deps = [":example"],
    exts = ["WixUiExtension"],
)

build_test(
    name = "build_test",
    targets = [
        ":rules_msi_example.msi",
    ],
)