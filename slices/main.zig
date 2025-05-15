const std = @import("std");
const expect = std.testing.expect;

fn total(values: []const i8) isize {
    var sum: isize = 0;
    for (values) |v| sum += v;
    return sum;
}

pub fn main() !void {
    const array = [_]i8{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];
    try expect(total(slice) == 6);
}
