const std = @import("std");

// Function that adds two integers
fn add(a: i32, b: i32) i32 {
    // a and b are not mutable
    // need to create a mutable local copy
    // the only way to change value from inside function is to use pointer
    return a + b;
}

// Recursive factorial function
fn factorial(n: u32) u32 {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

pub fn main() void {
    const result_1 = add(5, 7);
    std.debug.print("5 + 7 = {}\n", .{result_1});

    const num: u32 = 5;
    const result_2 = factorial(num);
    std.debug.print("Factorial of {} is {}\n", .{ num, result_2 });
}
