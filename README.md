# WiX Toolset support for Bazel

This package provides [Bazel](https://bazel.build) rules for building
Windows `.msi` installers using the WiX Toolset.

## Usage

In `MODULE.bazel` add this:

```
bazel_dep(name = "mjbots_rules_wix")
git_override(
    module_name = "mjbots_rules_wix",
    remote = "https://github.com/kleinpa/rules_wix",
    commit = "...",
)
```

Then in a `BUILD` file you can use:

```
load("@mjbots_rules_wix//:defs.bzl", "pkg_msi")

pkg_msi(
  name = "example.msi",
  src = "example.wxs",
  # ...
)
```
