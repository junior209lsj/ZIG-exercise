const std = @import("std");
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();
const stderr = std.io.getStdErr().writer();

test "if bool" {
    const a: i32 = 33;

    if (a == 33) {
        std.testing.expect(true) catch unreachable;
    } else {
        try std.testing.expect(false);
    }
}

test "if not bool" {
    const x: anyerror!i32 = error.aaaaa;

    if (x) |value| {
        try std.testing.expectEqual(value, 0);
    } else |err| {
        // try stdout.print("{} is false", .{err});
        try std.testing.expect(err == error.aaaaa);
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
