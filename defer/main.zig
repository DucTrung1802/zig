const std = @import("std");

pub fn main() void {
    std.debug.print("Start of function\n", .{});

    defer std.debug.print("First defer\n", .{});
    defer std.debug.print("Second defer\n", .{});
    defer std.debug.print("Third defer\n", .{});

    std.debug.print("End of function\n", .{});
}
