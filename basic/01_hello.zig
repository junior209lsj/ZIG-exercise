const std = @import("std");
const stdout = std.io.getStdOut().writer();
const stderr = std.io.getStdErr().writer();

pub fn main() !void {
    // comment
    // 잠재적으로 error를 발생시킬 수 있는 함수에서 error를 다루지 않으면 컴파일 에러
    // stdout.print("Not handling error\n", .{});

    // 단순 문자열 출력
    try stdout.print("Hello World\n", .{});

    // 포맷팅된 문자열 출력
    try stdout.print("Hello {s}\n", .{"World"});
    // 포맷을 지정하지 않는 경우 ==> string의 경우 컴파일 에러
    // try stdout.print("Hello {}\n", .{"world"});

    // 포맷팅된 숫자 출력
    try stdout.print("Hello {d}\n", .{3.14});
    // 포맷을 지정하지 않는 경우
    try stdout.print("Hello {}\n", .{3.14});

    // 진법 표기
    try stdout.print("Hello Base 10 [{d}] Base 8 [0{o}] Base 16 [0x{x}]\n", .{ 0x1234, 0x1234, 0x1234 });

    // 표준 에러에 출력
    try stderr.print("ERROR\n", .{});
}

// 공식문서 설명 발췌
// The specifier has several options for types:
// x and X: output numeric value in hexadecimal notation
// s:
// for pointer-to-many and C pointers of u8, print as a C-string using zero-termination
// for slices of u8, print the entire slice as a string without zero-termination
// e: output floating point value in scientific notation
// d: output numeric value in decimal notation
// b: output integer value in binary notation
// o: output integer value in octal notation
// c: output integer as an ASCII character. Integer type must have 8 bits at max.
// u: output integer as an UTF-8 sequence. Integer type must have 21 bits at max.
// ?: output optional value as either the unwrapped value, or null; may be followed by a format specifier for the underlying value.
// !: output error union value as either the unwrapped value, or the formatted error value; may be followed by a format specifier for the underlying value.
// *: output the address of the value instead of the value itself.
// any: output a value of any type using its default format.
