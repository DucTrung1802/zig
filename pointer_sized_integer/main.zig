const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer(); // Get a writer for standard output.

    // Compare usize and *u8, and print the result along with their sizes
    try stdout.print("usize == *u8: {} ({} vs {})\n", .{
        @sizeOf(usize) == @sizeOf(*u8), // Check if sizes of usize and *u8 are equal
        @sizeOf(usize), // Print size of usize
        @sizeOf(*u8), // Print size of *u8
    });

    // Compare isize and *u8, and print the result along with their sizes
    try stdout.print("isize == *u8: {} ({} vs {})\n", .{
        @sizeOf(isize) == @sizeOf(*u8), // Check if sizes of isize and *u8 are equal
        @sizeOf(isize), // Print size of isize
        @sizeOf(*u8), // Print size of *u8
    });

    // This comparison is redundant as it checks the same thing as the previous one
    try stdout.print("*const void == usize: {} ({} vs {})\n", .{
        @sizeOf(*const void) == @sizeOf(usize), // Check if sizes of *const void and usize are equal
        @sizeOf(*const void), // Print size of *const void
        @sizeOf(usize), // Print size of usize
    });

    // Compare *fn()void and usize, and print the result along with their sizes
    try stdout.print("*fn()void == usize: {} ({} vs {})\n", .{
        @sizeOf(*const fn () void) == @sizeOf(usize), // Check if sizes of *const fn()void and usize are equal
        @sizeOf(*const fn () void), // Print size of *const fn()void
        @sizeOf(usize), // Print size of usize
    });

    // Compare []u8 and usize, and print the result along with their sizes
    try stdout.print("[]u8 == usize: {} ({} vs {})\n", .{
        @sizeOf([]u8) == @sizeOf(usize), // Check if sizes of []u8 and usize are equal
        @sizeOf([]u8), // Print size of []u8 (slice of u8)
        @sizeOf(usize), // Print size of usize
    });

    // Compare *anyopaque and usize, and print the result along with their sizes
    try stdout.print("*anyopaque == usize: {} ({} vs {})\n", .{
        @sizeOf(*anyopaque) == @sizeOf(usize), // Check if sizes of *anyopaque and usize are equal
        @sizeOf(*anyopaque), // Print size of *anyopaque
        @sizeOf(usize), // Print size of usize
    });

    // Just for reference: print the actual size of these types
    try stdout.print("Size of usize: {} bytes\n", .{@sizeOf(usize)});
    try stdout.print("Size of pointer (*u8): {} bytes\n", .{@sizeOf(*u8)});
    try stdout.print("Size of isize: {} bytes\n", .{@sizeOf(isize)});
    try stdout.print("Size of *const void: {} bytes\n", .{@sizeOf(*const void)});
    try stdout.print("Size of *const fn()void: {} bytes\n", .{@sizeOf(*const fn () void)});
    try stdout.print("Size of []u8: {} bytes\n", .{@sizeOf([]u8)}); // Size of a slice ([]u8) is 16 bytes on a 64-bit system
    // Why 16 bytes
    // 8 bytes for pointer
    // 8 bytes for length of arrays
    try stdout.print("Size of *anyopaque: {} bytes\n", .{@sizeOf(*anyopaque)}); // *anyopaque can be casted to any pointer type
}
