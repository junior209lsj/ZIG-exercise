const std = @import("std");
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();
const stderr = std.io.getStdErr().writer();

test "if not bool" {
    const x: anyerror!i32 = error.BadValue;

    if (x) |value| {
        try std.testing.expectEqual(value, 0);
    } else |err| {
        // try stdout.print("{} is false", .{err});
        try std.testing.expect(err == error.BadValue);
    }
}

// pub fn main() !void {
//     const x: anyerror!i32 = 0;

//     try stdout.print("is true\n", .{});

//     if (x) |value| {
//         try std.testing.expectEqual(value, 0);
//     } else |err| {
//         stdout.print("{} is false", .{err});
//     }
// }
