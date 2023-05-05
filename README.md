```
❯❯❯ BAZEL_PATH=/Users/sushain/stripe/bazel/bazel-bin/src/bazel ./repro.sh
initial build
=============
Extracting Bazel installation...
Starting local Bazel server and connecting to it...
INFO: Starting clean (this may take a while). Consider using --async if the clean takes more than several minutes.
Starting local Bazel server and connecting to it...
INFO: Analyzed target @tensorflow//file:downloaded (1 packages loaded, 1 target configured).
INFO: Found 1 target...
WARNING: /private/var/tmp/_bazel/446231c10a500a532e75a3b984eb52af/external/tensorflow/file/BUILD:3:10: @tensorflow//file:downloaded is a source file, nothing will be built for it. If you want to build a target that consumes this file, try --compile_one_dependency
INFO: Elapsed time: 5.489s, Critical Path: 0.01s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action

cached build
============
Starting local Bazel server and connecting to it...
INFO: Starting clean (this may take a while). Consider using --async if the clean takes more than several minutes.
Starting local Bazel server and connecting to it...
INFO: Analyzed target @tensorflow//file:downloaded (1 packages loaded, 1 target configured).
INFO: Found 1 target...
WARNING: /private/var/tmp/_bazel/446231c10a500a532e75a3b984eb52af/external/tensorflow/file/BUILD:3:10: @tensorflow//file:downloaded is a source file, nothing will be built for it. If you want to build a target that consumes this file, try --compile_one_dependency
INFO: Elapsed time: 2.193s, Critical Path: 0.01s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
fetch time: 348.508ms

xattr build
===========
Starting local Bazel server and connecting to it...
INFO: Starting clean (this may take a while). Consider using --async if the clean takes more than several minutes.
Starting local Bazel server and connecting to it...
INFO: Analyzed target @tensorflow//file:downloaded (1 packages loaded, 1 target configured).
INFO: Found 1 target...
WARNING: /private/var/tmp/_bazel/446231c10a500a532e75a3b984eb52af/external/tensorflow/file/BUILD:3:10: @tensorflow//file:downloaded is a source file, nothing will be built for it. If you want to build a target that consumes this file, try --compile_one_dependency
INFO: Elapsed time: 1.869s, Critical Path: 0.01s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
fetch time: 64.852ms

xattr with hardlinks build
==========================
Starting local Bazel server and connecting to it...
INFO: Starting clean (this may take a while). Consider using --async if the clean takes more than several minutes.
Starting local Bazel server and connecting to it...
INFO: Analyzed target @tensorflow//file:downloaded (1 packages loaded, 1 target configured).
INFO: Found 1 target...
WARNING: /private/var/tmp/_bazel/446231c10a500a532e75a3b984eb52af/external/tensorflow/file/BUILD:3:10: @tensorflow//file:downloaded is a source file, nothing will be built for it. If you want to build a target that consumes this file, try --compile_one_dependency
INFO: Elapsed time: 1.793s, Critical Path: 0.01s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
fetch time: 5.208ms
```
