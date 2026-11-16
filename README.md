# crun

This is [crun](https://github.com/containers/crun), packaged for Zig.

## Installation

First, update your `build.zig.zon`:

```
# Initialize a `zig build` project if you haven't already
zig init
zig fetch --save git+https://github.com/lukaskastern/crun.git
```

You can then link `crun` in your `build.zig` with:

```zig
const crun_dep = b.dependency("crun", .{
    .target = target,
    .optimize = optimize,
});
your_module.linkLibrary(json_c_dep.artifact("crun"));
```

### Zig Version
The target zig version is 0.17.0
