load("//:rules.bzl", "pkg_msi")

package(default_visibility = ["//visibility:public"])

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
