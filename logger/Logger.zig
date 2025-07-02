const std = @import("std");

pub const Logger = struct {
    alloc: std.mem.Allocator,

    pub fn init(alloc: std.mem.Allocator) Logger {
        return Logger{ .alloc = alloc };
    }

    pub fn deinit(self: *Logger) void {
        _ = self;
    }

    pub fn debug(self: *Logger, comptime msg: []const u8, args: anytype) void {
        logWithLevel("DEBUG", self, msg, args);
    }

    pub fn info(self: *Logger, comptime msg: []const u8, args: anytype) void {
        logWithLevel("INFO", self, msg, args);
    }

    pub fn warn(self: *Logger, comptime msg: []const u8, args: anytype) void {
        logWithLevel("WARN", self, msg, args);
    }

    pub fn err(self: *Logger, comptime msg: []const u8, args: anytype) void {
        logWithLevel("ERROR", self, msg, args);
        self.handleError(msg, args);
    }

    fn handleError(self: *Logger, comptime msg: []const u8, args: anytype) void {
        _ = self;
        _ = msg;
        _ = args;
        // You can add actual error handling logic here
    }

    fn logWithLevel(comptime level: []const u8, self: *Logger, comptime msg: []const u8, args: anytype) void {
        _ = self;
        const stdout = std.io.getStdOut().writer();
        const timestamp = std.time.timestamp();
        var time_buf: [64]u8 = undefined;
        const time_str = formatTime(timestamp, &time_buf);
        stdout.print("{s} - {s}: " ++ msg ++ "\n", .{ time_str, level } ++ args) catch {};
    }

    fn isLeapYear(year: u32) bool {
        return (@mod(year, 4) == 0 and @mod(year, 100) != 0) or (@mod(year, 400) == 0);
    }

    fn daysInMonth(month: usize, year: u32) u32 {
        const days = [_]u32{ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
        if (month == 1 and isLeapYear(year)) return 29;
        return days[month];
    }

    fn pad2(buffer: []u8, n: u8) []const u8 {
        return std.fmt.bufPrint(buffer, "{:0>2}", .{n}) catch "??";
    }

    fn pad4(buffer: []u8, n: u32) []const u8 {
        return std.fmt.bufPrint(buffer, "{:0>4}", .{n}) catch "????";
    }

    fn formatTime(timestamp: i64, buffer: []u8) []const u8 {
        const SECONDS_PER_MINUTE = 60;
        const SECONDS_PER_HOUR = 60 * SECONDS_PER_MINUTE;
        const SECONDS_PER_DAY = 24 * SECONDS_PER_HOUR;

        var days = @divFloor(timestamp, SECONDS_PER_DAY);
        var secs_of_day = @mod(timestamp, SECONDS_PER_DAY);
        if (secs_of_day < 0) {
            secs_of_day += SECONDS_PER_DAY;
            days -= 1;
        }

        const hour: u8 = @intCast(@divTrunc(secs_of_day, SECONDS_PER_HOUR));
        const minute: u8 = @intCast(@divTrunc(@mod(secs_of_day, SECONDS_PER_HOUR), SECONDS_PER_MINUTE));
        const second: u8 = @intCast(@mod(secs_of_day, SECONDS_PER_MINUTE));

        var year: u32 = 1970;
        while (true) {
            const days_in_year: u32 = if (isLeapYear(year)) 366 else 365;
            if (days < days_in_year) break;
            days -= days_in_year;
            year += 1;
        }

        var month: usize = 0;
        while (month < 12) {
            const dim = daysInMonth(month, year);
            if (days < dim) break;
            days -= dim;
            month += 1;
        }

        const day = days + 1;

        var y_buf: [5]u8 = undefined;
        var m_buf: [2]u8 = undefined;
        var d_buf: [2]u8 = undefined;
        var h_buf: [2]u8 = undefined;
        var min_buf: [2]u8 = undefined;
        var s_buf: [2]u8 = undefined;

        return std.fmt.bufPrint(
            buffer,
            "UTC {s}-{s}-{s} {s}:{s}:{s}",
            .{
                pad4(&y_buf, year),
                pad2(&m_buf, @intCast(month + 1)),
                pad2(&d_buf, @intCast(day)),
                pad2(&h_buf, hour),
                pad2(&min_buf, minute),
                pad2(&s_buf, second),
            },
        ) catch "[format failed]";
    }
};
