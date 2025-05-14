const std = @import("std");

pub fn main() !void {
    const string = [_]u8{ 'a', 'b', 'c' };

    std.debug.print("\nLoop 1\n", .{});
    for (string, 0..) |character, index| {
        std.debug.print("{c} - {}\n", .{ character, index });
    }

    std.debug.print("\nLoop 2\n", .{});
    for (string) |character| {
        std.debug.print("{c}\n", .{character});
    }

    std.debug.print("\nLoop 3\n", .{});
    for (string, 0..) |_, index| {
        std.debug.print("Index: {}\n", .{index});
    }

    std.debug.print("\nLoop 4\n", .{});
    for (string) |_| {
        // Do nothing
    }
}
