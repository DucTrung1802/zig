// What This Does:
// Allocates 100 bytes.
// Sets up errdefer allocator.free(data); so if any error happens after allocation, the memory is freed automatically.
// Simulates an error (error.SimulatedFailure).
// If that error triggers, errdefer runs and frees the memory.
// If no error happens, we free manually.

const std = @import("std");

pub fn doSomething() !void {
    const allocator = std.heap.page_allocator;

    const data = try allocator.alloc(u8, 100);
    // Free the memory if an error occurs later
    errdefer allocator.free(data);

    // Let's simulate a failure after allocation
    if (true) {
        return error.SimulatedFailure;
    }

    // If we reach here, no error occurred, so we clean up manually
    allocator.free(data);
}

pub fn main() void {
    const result = doSomething();
    if (result) |err| {
        std.debug.print("Error: {}\n", .{err});
    } else {
        std.debug.print("Success!\n", .{});
    }
}
