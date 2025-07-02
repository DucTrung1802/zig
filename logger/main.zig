const std = @import("std");
const Logger = @import("Logger.zig").Logger;

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var logger = try Logger.init(allocator, null);

    logger.debug("Starting app with args: {s}", .{"none"});
    logger.info("User {s} logged in", .{"alice"});
    logger.warn("Low memory warning: {}MB left", .{128});
    logger.err("Unhandled exception: {s}", .{"NullPointerException"});

    logger.deinit();
}
