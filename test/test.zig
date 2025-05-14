const std = @import("std");

test "naughty pointer" {
    const x: u16 = 5;
    const y: *u8 = @ptrFromInt(x);
    std.debug.print("{}", .{y});
}
