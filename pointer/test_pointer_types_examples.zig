const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;

test "*T (pointer to one value)" {
    var x: i32 = 42;
    const ptr: *i32 = &x;
    print("*T points to: {}\n", .{ptr.*});
    ptr.* += 1;
    try expect(x == 43);
}

test "*[N]T (pointer to fixed-size array)" {
    var arr: [4]u8 = .{ 10, 20, 30, 40 };
    const fixed_ptr: *[4]u8 = &arr;
    print("*[N]T access index 2: {}\n", .{fixed_ptr[2]});
    try expect(fixed_ptr[3] == 40);
}

test "[*]T (many-item pointer)" {
    var arr: [4]u8 = .{ 1, 2, 3, 4 };
    const many_ptr: [*]u8 = &arr;
    many_ptr[0] = 9;
    print("[*]T modified first element: {}\n", .{arr[0]});
    try expect(arr[0] == 9);
}

test "[]T (slice)" {
    var arr = [_]u8{ 5, 6, 7, 8 };
    const slice: []u8 = arr[1..]; // slice from index 1 to end
    print("[]T slice length: {}, first element: {}\n", .{ slice.len, slice[0] });
    try expect(slice[0] == 6);
}
