const std = @import("std");

const Day = enum {
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
    Sunday,
};

pub fn main() void {
    const today: Day = Day.Saturday;

    switch (today) {
        Day.Monday => std.debug.print("It's Monday. Back to work!\n", .{}),
        Day.Tuesday => std.debug.print("It's Tuesday.\n", .{}),
        Day.Wednesday => std.debug.print("Midweek already!\n", .{}),
        Day.Thursday => std.debug.print("Almost Friday.\n", .{}),
        Day.Friday => std.debug.print("It's Friday! \n", .{}),
        Day.Saturday, Day.Sunday => std.debug.print("Weekend! \n", .{}),
    }
}
