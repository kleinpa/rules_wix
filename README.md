# Bazel Rules for the WiX Toolset

This package provides [Bazel](https://bazel.build) rules for building
Windows `.msi` installers using the [WiX Toolset](https://wixtoolset.org).

## Usage

In `MODULE.bazel` add:

```
bazel_dep(name = "mjbots_rules_wix")
git_override(
    module_name = "mjbots_rules_wix",
    remote = "https://github.com/kleinpa/rules_wix",
    commit = "...",
)
```

Then in a `BUILD` file:

```
load("@mjbots_rules_wix//:defs.bzl", "pkg_msi")

pkg_msi(
  name = "example.msi",
  src = "example.wxs",
  # ...
)
```
