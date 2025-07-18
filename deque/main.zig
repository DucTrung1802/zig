const std = @import("std");
const Deque = @import("deque.zig").Deque;

pub const Area = struct {
    alloc: std.mem.Allocator,
    string: std.ArrayList(u8),

    pub fn init(alloc: std.mem.Allocator, data: []const u8) !Area {
        var local_string = std.ArrayList(u8).init(alloc);
        try local_string.appendSlice(data);

        return Area{
            .alloc = alloc,
            .string = local_string,
        };
    }

    pub fn deinit(self: *Area) void {
        self.string.deinit();
    }
};

// Helper to print current deque state
fn printDeque(d: *Deque(u32)) !void {
    const items: []const u32 = try d.items();
    std.debug.print("Deque (len={}): ", .{d.len()});
    for (items) |item| {
        std.debug.print("{} ", .{item});
    }
    std.debug.print("\n", .{});
}

fn printAreaDeque(d: *Deque(Area)) !void {
    const items: []const Area = try d.items();
    std.debug.print("Deque (len={}): ", .{d.len()});
    for (items) |item| {
        std.debug.print("{s} ", .{item.string.items});
    }
    std.debug.print("\n", .{});
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var deque: Deque(u32) = try Deque(u32).init(allocator, 4);
    defer deque.deinit();

    // Test pushBack and pushFront
    try deque.pushBack(10);
    try deque.pushBack(20);
    try deque.pushBack(30);
    try deque.pushBack(40);
    try deque.pushBack(50);
    try deque.pushBack(60);
    try deque.pushFront(5);
    try deque.pushBack(15);
    try deque.pushFront(1);

    std.debug.print("After pushes:\n", .{});
    try printDeque(&deque);

    // Test peekFront and peekBack
    std.debug.print("Front: {}\n", .{try deque.peekFront()});
    std.debug.print("Back: {}\n", .{try deque.peekBack()});

    // Test popFront
    const popped_front = try deque.popFront();
    std.debug.print("Popped front: {}\n", .{popped_front});
    try printDeque(&deque);

    // Test popBack
    const popped_back = try deque.popBack();
    std.debug.print("Popped back: {}\n", .{popped_back});
    try printDeque(&deque);

    // Test isEmpty and len
    std.debug.print("Deque is empty? {}\n", .{deque.isEmpty()});
    std.debug.print("Deque length: {}\n", .{deque.len()});

    // Pop remaining elements
    while (!deque.isEmpty()) {
        const val = try deque.popFront();
        std.debug.print("Popped: {}\n", .{val});
    }

    std.debug.print("Deque is empty? {}\n", .{deque.isEmpty()});

    var area_deque: Deque(Area) = try Deque(Area).init(allocator, 4);
    defer deque.deinit();

    try area_deque.pushBack(try Area.init(allocator, "Hello"));
    try area_deque.pushBack(try Area.init(allocator, "World"));

    try printAreaDeque(&area_deque);
}
