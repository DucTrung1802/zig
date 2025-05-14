const std = @import("std");

pub fn main() void {
    const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' };

    std.debug.print("{s}\n", .{a[0..]});
    std.debug.print("{}\n", .{a.len});
    std.debug.print("{c}\n", .{b[0..]});
    std.debug.print("{}\n", .{b.len});
}
