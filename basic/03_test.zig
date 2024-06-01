/// zig test 03_test.zig
/// ?? zig run 03_test.zig 하면?
const std = @import("std");

fn increase(x: i32) i32 {
    return x + 1;
}

test "test" {
    try std.testing.expectEqual(increase(32), 33);
    try std.testing.expect(increase(32) == 33);
}

test "string test" {
    try std.testing.expectEqualStrings("123123123", "123123123");
}

// 실패하는 테스트
// test "expected to fail" {
//     try std.testing.expect(false);
// }
