const std = @import("std");

pub fn main() void {
    const constant: i32 = 5;
    var variable: u32 = 5000;
    variable += 1;

    const inferred_constant = @as(i32, 5);
    var inferred_variable = @as(u16, 5000);
    inferred_variable += 1;

    std.debug.print("{}\n", .{constant});
    std.debug.print("{}\n", .{variable});
    std.debug.print("{}\n", .{inferred_constant});
    std.debug.print("{}\n", .{inferred_variable});
}
