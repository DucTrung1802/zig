const std = @import("std");

pub fn main() void {
    var i: u8 = 2;
    while (i < 100) {
        i *= 2;
    }
    std.debug.print("{}", .{i}); // expected value: 128
}
