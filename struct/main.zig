const std = @import("std");

const Vec3 = struct { x: f32, y: f32, z: f32 };

test "struct usage" {
    const my_vector = Vec3{ .x = 0, .y = 100, .z = 50 };
    const new_vector = my_vector;
    std.debug.print("{}", .{new_vector});
}

const Vec4 = struct { x: f32 = 0, y: f32 = 0, z: f32 = 0, w: f32 = 0 };

test "struct defaults" {
    const my_vector = Vec4{
        .x = 25,
        .y = -50,
    };
    _ = my_vector;
}

const expect = @import("std").testing.expect;

const Stuff = struct {
    x: i32,
    y: i32,
    fn swap(self: *Stuff) void {
        const tmp = self.x;
        self.x = self.y;
        self.y = tmp;
    }
};

test "automatic dereference" {
    var thing = Stuff{ .x = 10, .y = 20 };
    thing.swap();
    try expect(thing.x == 20);
    try expect(thing.y == 10);
}
