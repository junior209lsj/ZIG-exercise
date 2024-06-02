const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    // assignment keyword
    // const: 값을 변경하려고 할 시 컴파일 에러 발생
    const c_value: i32 = 33;
    // c_value = 44; // 에러 발생

    // var: 값을 변경하지 않으면 컴파일 에러 발생 (이 경우 const 사용)
    var v_value: i32 = 33;
    v_value = 44;

    // 변수 선언 시 값을 할당하지 않는 경우 undefined 사용
    var undef_value: i32 = undefined;
    undef_value = 55;

    // double type
    const g_acceleration: f64 = 9.80665;

    const no_type_value = 3232;
    // const no_type_value = 3232.3;

    const flag: bool = false; // true or false
    _ = flag;

    try stdout.print("c_value: type {}, value {}\n", .{ @TypeOf(c_value), c_value });
    try stdout.print("v_value = {}\n", .{v_value});
    try stdout.print("g = {}\n", .{g_acceleration});
    try stdout.print("no_type_value: type {}, value {}\n", .{ @TypeOf(no_type_value), no_type_value });
}
