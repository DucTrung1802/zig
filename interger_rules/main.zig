const std = @import("std");

pub fn main() !void {
    // const decimal_int: i32 = 98222;
    // const hex_int: u8 = 0xff;
    // const another_hex_int: u8 = 0xFF;
    // const octal_int: u16 = 0o755;
    // const binary_int: u8 = 0b11110000;

    // const one_billion: u64 = 1_000_000_000;
    // const binary_mask: u64 = 0b1_1111_1111;
    // const permissions: u64 = 0o7_5_5;
    // const big_address: u64 = 0xFF80_0000_0000_0000;

    const x: u64 = 200;
    const y = @as(u8, @intCast(x));
    std.debug.print("{}", .{@TypeOf(y)});
}
