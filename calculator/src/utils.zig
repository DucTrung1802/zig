pub fn printLine(msg: []const u8) void {
    const std = @import("std");
    std.debug.print("{s}\n", .{msg});
}
