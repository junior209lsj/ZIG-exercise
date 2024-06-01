const std = @import("std");
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();

// overflow 발생시 에러
test "basic" {
    const alloc = std.testing.allocator;
    const buf = try stdin.readUntilDelimiterAlloc(alloc, '\n', 100);
    const x: i32 = try std.fmt.parseInt(i32, buf, 10);
    var a: u8 = undefined;
    a = @intCast(x);

    const b: u8 = 6;

    const c: u8 = a + b;

    try stdout.print("{}\n", .{c});

    try std.testing.expectEqual(c, 156);

    alloc.free(buf);
}

test "wrap" {
    const a: u8 = 250;
    const b: u8 = 6;

    const c: u8 = a +% b;

    try std.testing.expectEqual(c, 0);
}

test "sat" {
    const a: u8 = 250;
    const b: u8 = 6;

    const c: u8 = a +| b;

    try std.testing.expectEqual(c, 255);
}
