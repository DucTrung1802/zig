const std = @import("std");

pub fn main() !void {
    const floating_point: f64 = 123.0E+77;
    const another_float: f64 = 123.0;
    const yet_another: f64 = 123.0e+77;

    const hex_floating_point: f64 = 0x103.70p-5;
    const another_hex_float: f64 = 0x103.70;
    const yet_another_hex_float: f64 = 0x103.70P-5;

    std.debug.print("floating_point: {}\n", .{floating_point});
    std.debug.print("another_float: {}\n", .{another_float});
    std.debug.print("yet_another: {}\n", .{yet_another});

    std.debug.print("hex_floating_point: {}\n", .{hex_floating_point});
    std.debug.print("another_hex_float: {}\n", .{another_hex_float});
    std.debug.print("yet_another_hex_float: {}\n", .{yet_another_hex_float});
}
