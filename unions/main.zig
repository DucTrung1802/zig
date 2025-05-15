const std = @import("std");

const Result = union(enum) {
    int: i64,
    float: f64,
    bool: bool,
};

test "simple union" {
    var result = Result{ .int = 1234 };
    switch (result) {
        .int => |v| std.debug.print("int: {}\n", .{v}),
        else => {},
    }

    // Reassign to a new union value
    result = Result{ .float = 12.34 };
    switch (result) {
        .float => |v| std.debug.print("float: {}\n", .{v}),
        else => {},
    }
}
