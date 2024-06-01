const std = @import("std");

pub fn main() !void {
    // comment
    const stdout = std.io.getStdOut().writer();
    const stderr = std.io.getStdErr().writer();
    // const stdin = std.io.getStdIn().reader();
    try stdout.writeAll("!#!#!#!#!#!#!#!#!#!#\n");
    try stdout.print("Hello {s}\n", .{"world"});
    try stderr.print("ERROR\n", .{});
}
