const std = @import("std");

pub fn increment_i32_pointer_value(pointer: *i32) void {
    pointer.* += 1;
}

pub fn main() void {
    std.debug.print("hello world!\n", .{});

    var x: i32 = 5;
    const y: *i32 = &x;
    std.debug.print("x = {}\n", .{x});
    std.debug.print("y.* = {}\n", .{y.*});
    increment_i32_pointer_value(y);
    std.debug.print("x = {}\n", .{x});
    std.debug.print("y.* = {}\n", .{y.*});
}
