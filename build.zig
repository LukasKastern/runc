const std = @import("std");

pub fn build(b: *std.Build) !void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    const upstream = b.dependency("upstream", .{
        .target = target,
        .optimize = optimize,
    });
    const ocispec = b.dependency("ocispec", .{
        .target = target,
        .optimize = optimize,
    });

    const json_c = ocispec.builder.dependency("json_c", .{
        .target = target,
        .optimize = optimize,
    });

    const config = b.addConfigHeader(.{
        .style = .{
            .autoconf_undef = b.path("config.h.in"),
        },
        .include_path = "config.h",
    }, .{
        // Define if CRIU_CONFIG_FILE is available
        .CRIU_CONFIG_FILE = null,

        // Define if CRIU join NS support is available
        .CRIU_JOIN_NS_SUPPORT = null,

        // Define if libcriu supports lazy pages
        .CRIU_LAZY_PAGES = null,

        // Define if CRIU_NETWORK_LOCK_SKIP is available
        .CRIU_NETWORK_LOCK_SKIP_SUPPORT = null,

        // Define if CRIU pre-dump support is available
        .CRIU_PRE_DUMP_SUPPORT = null,

        // Define if shared libraries are enabled
        .DYNLOAD_LIBCRUN = null,

        // Define to 1 if the system has the type 'atomic_int'.
        .HAVE_ATOMIC_INT = 1,

        // Define if libblake3 is available
        .HAVE_BLAKE3 = null,

        // Define if libcap is available
        .HAVE_CAP = null,

        // Define to 1 if you have the 'copy_file_range' function.
        .HAVE_COPY_FILE_RANGE = 1,

        // Define if code coverage is enabled
        .HAVE_COVERAGE = null,

        // Define if CRIU is available
        .HAVE_CRIU = null,

        // Define to 1 if you have the <dlfcn.h> header file.
        .HAVE_DLFCN_H = 11,

        // Define if DLOPEN is available
        .HAVE_DLOPEN = 1,

        // Define to 1 if you have the 'eaccess' function.
        .HAVE_EACCESS = 1,

        // Define if eBPF is available
        .HAVE_EBPF = 1,

        // Define if error.h is usable
        .HAVE_ERROR_H = 1,

        // Define to 1 if you have the 'fgetpwent_r' function.
        .HAVE_FGETPWENT_R = 1,

        // Define to 1 if you have the 'fgetxattr' function.
        .HAVE_FGETXATTR = 1,

        // Define if FSCONFIG_CMD_CREATE is available in linux/mount.h
        .HAVE_FSCONFIG_CMD_CREATE_LINUX_MOUNT_H = 1,

        // Define if FSCONFIG_CMD_CREATE is available in sys/mount.h
        .HAVE_FSCONFIG_CMD_CREATE_SYS_MOUNT_H = 1,

        // Define to 1 if you have the 'hsearch_r' function.
        .HAVE_HSEARCH_R = 1,

        // Define to 1 if you have the <inttypes.h> header file.
        .HAVE_INTTYPES_H = 1,

        // Define to 1 if you have the 'issetugid' function.
        .HAVE_ISSETUGID = null,

        // Define to 1 if you have the <lauxlib.h> header file.
        .HAVE_LAUXLIB_H = null,

        // Define if libkrun is available
        .HAVE_LIBKRUN = null,

        // Define to 1 if you have the <libkrun.h> header file.
        .HAVE_LIBKRUN_H = null,

        // Define to 1 if you have the <linux/bpf.h> header file.
        .HAVE_LINUX_BPF_H = 1,

        // Define to 1 if you have the <linux/ioprio.h> header file.
        .HAVE_LINUX_IOPRIO_H = 1,

        // Define to 1 if you have the <linux/openat2.h> header file.
        .HAVE_LINUX_OPENAT2_H = 1,

        // Define if log2 is available
        .HAVE_LOG2 = 1,

        // Define to 1 if you have the <luaconf.h> header file.
        .HAVE_LUACONF_H = null,

        // Define to 1 if you have the <lualib.h> header file.
        .HAVE_LUALIB_H = null,

        // Define to 1 if you have the <lua.h> header file.
        .HAVE_LUA_H = null,

        // Define to 1 if you have the 'memfd_create' function.
        .HAVE_MEMFD_CREATE = 1,

        // Define if mono is available
        .HAVE_MONO = null,

        // Define to 1 if you have the <mono/metadata/environment.h> header file.
        .HAVE_MONO_METADATA_ENVIRONMENT_H = null,

        // Define to 1 if you have the 'sd_notify_barrier' function.
        .HAVE_SD_NOTIFY_BARRIER = 1,

        // Define if seccomp is available
        .HAVE_SECCOMP = null,

        // Define to 1 if you have the 'seccomp_export_bpf_mem' function.
        .HAVE_SECCOMP_EXPORT_BPF_MEM = 1,

        // Define if SECCOMP_GET_NOTIF_SIZES is available
        .HAVE_SECCOMP_GET_NOTIF_SIZES = 1,

        // Define to 1 if you have the <seccomp.h> header file.
        .HAVE_SECCOMP_H = 1,

        // /* Define if spin is available */
        .HAVE_SPIN = null,

        // Define to 1 if you have the 'statx' function.
        .HAVE_STATX = 1,

        // Define to 1 if you have the <stdatomic.h> header file.
        .HAVE_STDATOMIC_H = 1,

        // /* Define to 1 if you have the <stdint.h> header file. */
        .HAVE_STDINT_H = 1,

        // /* Define to 1 if you have the <stdio.h> header file. */
        .HAVE_STDIO_H = 1,

        // /* Define to 1 if you have the <stdlib.h> header file. */
        .HAVE_STDLIB_H = 1,

        // /* Define to 1 if you have the <strings.h> header file. */
        .HAVE_STRINGS_H = 1,

        // /* Define to 1 if you have the <string.h> header file. */
        .HAVE_STRING_H = 1,

        // /* Define if libsystemd is available */
        .HAVE_SYSTEMD = null, // TODO shall we add this?

        // Define to 1 if you have the <systemd/sd-bus.h> header file.
        .HAVE_SYSTEMD_SD_BUS_H = null,

        // Define to 1 if you have the <sys/capability.h> header file.
        .HAVE_SYS_CAPABILITY_H = 1,

        // Define to 1 if you have the <sys/stat.h> header file.
        .HAVE_SYS_STAT_H = 1,

        // Define to 1 if you have the <sys/types.h> header file.
        .HAVE_SYS_TYPES_H = 1,

        // Define to 1 if you have the <unistd.h> header file.
        .HAVE_UNISTD_H = 1,

        // Define if WAMR is available
        .HAVE_WAMR = null,

        // Define if WasmEdge is available
        .HAVE_WASMEDGE = null,

        // Define to 1 if you have the <wasmedge/wasmedge.h> header file.
        .HAVE_WASMEDGE_WASMEDGE_H = null,

        // Define if wasmer is available
        .HAVE_WASMER = null,

        // /* Define to 1 if you have the <wasmer.h> header file. */
        .HAVE_WASMER_H = null,

        // /* Define if wasmtime is available */
        .HAVE_WASMTIME = null,

        // /* Define to 1 if you have the <wasmtime.h> header file. */
        .HAVE_WASMTIME_H = null,

        // /* Define to 1 if you have the <wasm_export.h> header file. */
        .HAVE_WASM_EXPORT_H = null,

        // /* LIBCRUN_PUBLIC */
        .LIBCRUN_PUBLIC = {},

        // /* Define to the sub-directory where libtool stores uninstalled libraries. */
        .LT_OBJDIR = ".libs/",

        // /* Name of package */
        .PACKAGE = "crun",

        // /* Define to the address where bug reports for this package should be sent. */
        .PACKAGE_BUGREPORT = "giuseppe@scrivano.org",

        // /* Define to the full name of this package. */
        .PACKAGE_NAME = "crun",

        // /* Define to the full name and version of this package. */
        .PACKAGE_STRING = "crun 1.31",

        // /* Define to the one symbol short name of this package. */
        .PACKAGE_TARNAME = "crun",

        // /* Define to the home page for this package. */
        .PACKAGE_URL = "",

        // /* Define to the version of this package. */
        .PACKAGE_VERSION = "1.31",

        // /* Define if seccomp_arch_resolve_name is available */
        .SECCOMP_ARCH_RESOLVE_NAME = 1,

        // /* Define if shared libraries are enabled */
        .SHARED_LIBCRUN = null,

        // /* Define to 1 if all of the C89 standard headers exist (not just the ones
        //    required in a freestanding environment). This macro is provided for
        //    backward compatibility; new code need not use it. */
        .STDC_HEADERS = 1,

        // /* Version number of package */
        // #define VERSION "1.31"
        .VERSION = "1.31",
    });

    const lib_crun = b.addLibrary(.{
        .name = "crun",
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });
    lib_crun.root_module.addCSourceFiles(.{
        .files = libcrun_sources,
        .flags = &.{},
        .language = .c,
        .root = upstream.path("."),
    });
    lib_crun.root_module.addIncludePath(config.getOutputDir());

    // Git version
    // TODO (lukas): probably should generate this ourselves
    const git_version = b.addWriteFile("git-version.h",
        \\/* autogenerated.  */
        \\#ifndef GIT_VERSION
        \\# define GIT_VERSION "a84965e1278d08d6c75d5b8a41a3e72a7a11fa5b"
        \\#endif
        \\
    );
    lib_crun.root_module.addIncludePath(git_version.getDirectory());

    // Link ocispec
    lib_crun.root_module.linkLibrary(ocispec.artifact("ocispec"));

    lib_crun.installHeadersDirectory(upstream.path("src"), "", .{});

    lib_crun.root_module.linkLibrary(json_c.artifact("json_c"));

    // Install libcrun
    b.installArtifact(lib_crun);

    // Build crun
    const crun = b.addExecutable(.{
        .name = "crun",
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });
    crun.root_module.addCSourceFiles(.{
        .files = crun_sources,
        .flags = &.{},
        .language = .c,
        .root = upstream.path("."),
    });
    crun.root_module.addIncludePath(config.getOutputDir());
    crun.root_module.addIncludePath(git_version.getDirectory());
    crun.root_module.linkLibrary(lib_crun);

    b.installArtifact(crun);
}

const libcrun_sources: []const []const u8 = &.{
    "src/libcrun/utils.c",
    "src/libcrun/string_map.c",
    "src/libcrun/ring_buffer.c",
    "src/libcrun/cgroup-cgroupfs.c",
    "src/libcrun/cgroup-resources.c",
    "src/libcrun/cgroup-setup.c",
    "src/libcrun/cgroup-systemd.c",
    "src/libcrun/cgroup-utils.c",
    "src/libcrun/cgroup.c",
    "src/libcrun/chroot_realpath.c",
    "src/libcrun/cloned_binary.c",
    "src/libcrun/container.c",
    "src/libcrun/criu.c",
    "src/libcrun/custom-handler.c",
    "src/libcrun/ebpf.c",
    "src/libcrun/error.c",
    "src/libcrun/handlers/handler-utils.c",
    "src/libcrun/handlers/krun.c",
    "src/libcrun/handlers/mono.c",
    "src/libcrun/handlers/spin.c",
    "src/libcrun/handlers/wasmedge.c",
    "src/libcrun/handlers/wasmer.c",
    "src/libcrun/handlers/wasmtime.c",
    "src/libcrun/handlers/wamr.c",
    "src/libcrun/intelrdt.c",
    "src/libcrun/io_priority.c",
    "src/libcrun/linux.c",
    "src/libcrun/mount_flags.c",
    "src/libcrun/scheduler.c",
    "src/libcrun/mempolicy.c",
    "src/libcrun/seccomp.c",
    "src/libcrun/seccomp_notify.c",
    "src/libcrun/signals.c",
    "src/libcrun/spec.c",
    "src/libcrun/status.c",
    "src/libcrun/net_device.c",
    "src/libcrun/terminal.c",
    "src/libcrun/blake3/blake3.c",
    "src/libcrun/blake3/blake3_portable.c",
};

const crun_sources: []const []const u8 = &.{
    "src/crun.c",
    "src/run.c",
    "src/delete.c",
    "src/kill.c",
    "src/pause.c",
    "src/unpause.c",
    "src/oci_features.c",
    "src/spec.c",
    "src/exec.c",
    "src/list.c",
    "src/create.c",
    "src/start.c",
    "src/state.c",
    "src/update.c",
    "src/ps.c",
    "src/checkpoint.c",
    "src/restore.c",
    "src/mounts.c",
    "src/run_create.c",
};
