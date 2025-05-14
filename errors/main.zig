const std = @import("std");

pub fn main() !void {
    const FileOpenError = error{
        AccessDenied,
        OutOfMemory,
        FileNotFound,
    };
    std.debug.print("{}", .{FileOpenError.AccessDenied});
}
