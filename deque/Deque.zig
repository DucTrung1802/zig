const std = @import("std");

pub fn Deque(comptime T: type) type {
    return struct {
        allocator: std.mem.Allocator,
        buffer: []T,
        capacity: usize,
        count: usize,
        head: usize,
        tail: usize,

        pub fn init(allocator: std.mem.Allocator, initial_capacity: usize) !Deque(T) {
            return Deque(T){
                .allocator = allocator,
                .buffer = try allocator.alloc(T, initial_capacity),
                .capacity = initial_capacity,
                .count = 0,
                .head = 0,
                .tail = 0,
            };
        }

        pub fn deinit(self: *Deque(T)) void {
            _ = self;
        }

        fn grow(self: *Deque(T)) !void {
            const new_capacity = self.capacity * 2;
            var new_buffer = try self.allocator.alloc(T, new_capacity);

            // Copy old elements in order into new buffer
            for (try self.items(), 0..) |item, i| {
                new_buffer[i] = item;
            }

            self.allocator.free(self.buffer);
            self.buffer = new_buffer;
            self.capacity = new_capacity;
            self.head = 0;
            self.tail = self.count;
        }

        pub fn pushBack(self: *Deque(T), value: T) !void {
            if (self.count == self.capacity) {
                try self.grow();
            }
            self.buffer[self.tail] = value;
            self.tail = (self.tail + 1) % self.capacity;
            self.count += 1;
        }

        pub fn pushFront(self: *Deque(T), value: T) !void {
            if (self.count == self.capacity) {
                try self.grow();
            }
            self.head = (self.head + self.capacity - 1) % self.capacity;
            self.buffer[self.head] = value;
            self.count += 1;
        }

        pub fn popBack(self: *Deque(T)) !T {
            if (self.count == 0) return error.Empty;
            self.tail = (self.tail + self.capacity - 1) % self.capacity;
            const value = self.buffer[self.tail];
            self.count -= 1;
            return value;
        }

        pub fn popFront(self: *Deque(T)) !T {
            if (self.count == 0) return error.Empty;
            const value = self.buffer[self.head];
            self.head = (self.head + 1) % self.capacity;
            self.count -= 1;
            return value;
        }

        pub fn peekFront(self: *Deque(T)) !T {
            if (self.count == 0) return error.Empty;
            return self.buffer[self.head];
        }

        pub fn peekBack(self: *Deque(T)) !T {
            if (self.count == 0) return error.Empty;
            const index = (self.tail + self.capacity - 1) % self.capacity;
            return self.buffer[index];
        }

        pub fn len(self: *Deque(T)) usize {
            return self.count;
        }

        pub fn isEmpty(self: *Deque(T)) bool {
            return self.count == 0;
        }

        pub fn items(self: *Deque(T)) ![]const T {
            var slice = try self.allocator.alloc(T, self.count);
            var i: usize = 0;
            var idx = self.head;
            while (i < self.count) : (i += 1) {
                slice[i] = self.buffer[idx];
                idx = (idx + 1) % self.capacity;
            }
            return slice;
        }
    };
}
