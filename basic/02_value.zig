const std = @import("std");
const print = std.debug.print;

/// 리턴타입에 !가 붙으면 오류를 반환할 수 있음을 의미
/// try stdout.print()에서 오류를 반환할 수 있으므로 !void로 해야되고, void로 하면 에러 뜸
/// stdout에서 에러 처리 안하면 에러 뜸
pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const c_value: i32 = 33;
    // c_value = 44; // 에러 발생
    var v_value: i32 = 33;
    v_value = 44;
    // var div_value: i32 = 7 / 4; // 이렇게 하면 어떻게 될까?
    const div_value: i32 = 7 / 4; // 정수 나눗셈
    const div_f_value: f32 = 7.0 / 4.0;

    try stdout.print("c_value: type {}, value {}\n", .{ @TypeOf(c_value), c_value });
    try stdout.print("v_value = {}\n", .{v_value});
    try stdout.print("div_value = {}\n", .{div_value});
    // try stdout.print("div_f_value = {}\n", .{div_f_value}); // {d}와 {}의 차이
    try stdout.print("div_f_value = {d}\n", .{div_f_value});
}
