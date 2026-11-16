# json-c

This is [json-c](https://github.com/json-c/json-c), packaged for Zig.

## Installation

First, update your `build.zig.zon`:

```
# Initialize a `zig build` project if you haven't already
zig init
zig fetch --save git+https://github.com/lukaskastern/json-c.git
```

You can then link `json-c` in your `build.zig` with:

```zig
const json_c_dep = b.dependency("json-c", .{
    .target = target,
    .optimize = optimize,
});
your_module.linkLibrary(json_c_dep.artifact("json-c"));
```

### Zig Version
The target zig version is 0.17.0
