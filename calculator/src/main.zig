const std = @import("std");
const math = @import("math/math.zig");
const utils = @import("utils/utils.zig");

pub fn main() !void {
    const sum = math.add(10, 5);
    const diff = math.subtract(10, 5);

    utils.printLine("Results:");
    std.debug.print("10 + 5 = {}\n", .{sum});
    std.debug.print("10 - 5 = {}\n", .{diff});
}
