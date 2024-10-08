load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def add_wix_deps():
    if not native.existing_rule("com_github_wixtoolset_wix3"):
        http_archive(
            name = "com_github_wixtoolset_wix3",
            urls = ["https://github.com/wixtoolset/wix3/releases/download/wix3112rtm/wix311-binaries.zip"],
            sha256 = "2c1888d5d1dba377fc7fa14444cf556963747ff9a0a289a3599cf09da03b9e2e",
            build_file = Label("//:wix3.BUILD"),
        )