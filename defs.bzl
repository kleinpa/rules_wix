def _pkg_msi_impl(ctx):
    obj = ctx.actions.declare_file(ctx.label.name + ".obj")
    out = ctx.actions.declare_file(ctx.label.name)

    my_deps = []
    for x in ctx.attr.deps:
        my_deps += x.files.to_list()
        
    exts = []
    for x in ctx.attr.exts:
        exts += ["-ext", x]

    ctx.actions.run(
        outputs = [obj],
        inputs = [ctx.file.src] + my_deps,
        executable = ctx.executable._candle,
        arguments = ["-nologo", "-arch", ctx.attr.arch] +
            exts + ["-o", obj.path, ctx.file.src.path],
    )

    ctx.actions.run(
        outputs = [out],
        inputs = [obj] + my_deps,
        executable = ctx.executable._light,
        arguments = ["-nologo"] + exts + ["-out", out.path, obj.path],
    )

    return [DefaultInfo(
        files = depset([out]),
    )]

pkg_msi = rule(
    implementation = _pkg_msi_impl,
    attrs = {
        "src" : attr.label(allow_single_file = True),
        "deps" : attr.label_list(allow_files = True),
        "exts" : attr.string_list(),
        "arch" : attr.string(default = "x64"),
        "_candle" : attr.label(
            default = "@com_github_wixtoolset_wix3//:candle",
            allow_single_file = True,
            executable = True,
            cfg = "host",
        ),
        "_light" : attr.label(
            default = "@com_github_wixtoolset_wix3//:light",
            allow_single_file = True,
            executable = True,
            cfg = "host",
        ),
    }
)
