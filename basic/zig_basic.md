# Hello, World

zig는 표준 출력, 표준 에러에 해당하는 스트림을 열어서 커맨드라인에 값을 출력할 수 있다. `print` 메소드를 사용하면 C의 `printf`와 같이 포맷팅된 문자열을 터미널에 출력한다.

zig 표준 라이브러리는 다음과 같이 불러온다.

```zig
const std = @import("std");
```

표준 출력, 표준 에러 스트림은 다음과 같이 생성한다

```zig
const stdout = std.io.getStdOut().writer();
const stderr = std.io.getStdErr().writer();
```

zig의 메인 제어흐름은 C와 같이 `main` 함수에서 수행된다. `main` 함수의 기본적인 형태는 다음과 같다.

```zig
pub fn main() !void {
    // ...
}
```

`pub`은 외부 모듈에서도 쓸 수있는 함수라는 의미, `!void`는 함수가 void 또는 error를 리턴한다는 것을 의미한다. `main` 함수는 무조건 `pub` 함수여야 하며, 함수 내에서 에러를 반환하는 다른 서브루틴이 있을 수 있기 때문에 `!void`를 리턴하도록 한다.

단순한 문자열은 다음과 같이 출력한다.

```zig
try stdout.print("Hello World\n", .{});
```

`print` 메소드의 리턴 데이터타입은 에러 또는 `void`이다. zig는 잠재적으로 에러를 반환하는 함수의 error 값을 다루지 않으면 컴파일 에러를 발생시키므로, 프로그래밍 시 필히 함수가 반환한 error를 다뤄야 한다.  일단 이 섹션에서는 에러를 다루는 가장 간단한 방법인 `try`를 사용했다. 단, zig의 `try` 구문은 C++의 `try`, `catch`, `finally`나 Python의 `try`, `catch`, `except`와는 달리 아래 구문의 단축어를 의미한다.

```zig
stdout.print("Hello World\n", .{}) catch |err| return err;
```

에러처리에 대한 상세한 내용은 Error handling 섹션에서 다룬다.

> TODO: error handling 설명 부분과 연계

`print`의 첫 번째 인자에는 format string을 넣을 수 있다. `{specifier}`와 같이 사용하면 된다. 문자열, 숫자, 16, 8진법 정수를 출력하는 예시는 다음과 같다.

```zig
// 포맷팅된 문자열 출력
try stdout.print("Hello {s}\n", .{"World"});

// 포맷팅된 숫자 출력
try stdout.print("Hello {d}\n", .{3.14});
// 포맷을 지정하지 않는 경우
try stdout.print("Hello {}\n", .{3.14});

// 진법 표기
try stdout.print("Hello Base 10 [{d}] Base 8 [0{o}] Base 16 [0x{x}]\n", .{ 0x1234, 0x1234, 0x1234 });

// 표준 에러에 출력
try stderr.print("ERROR\n", .{});
```

Specifier의 종류는 [zig 표준 라이브러리 문서](https://ziglang.org/documentation/master/std/#std.fmt.format)에서 확인 가능하다.

표준 에러에 내용을 출력하는 것도 표준 출력과 동일한 방법으로 한다.

```zig
try stderr.print("ERROR\n", .{});
```

이 섹션에 해당하는 예제 코드 전체는 `01_hello.zig`이며 이 소스 파일은 다음과 같은 명령어로 실행한다.

```bash
zig run 01_hello.zig
```

```
출력 결과
Hello World
Hello World
Hello 3.14
Hello 3.14e0
Hello Base 10 [4660] Base 8 [011064] Base 16 [0x1234]
ERROR
```

# Value and Type

zig에서 변수를 정의할 때는 할당 방식, type을 명시해야 한다. 할당 방식은 필수적으로 명시해야 하고 타입은 명시하지 않아도 되는 상황이 있다. 변수는 다음의 형식으로 정의된다.

```
[Assignment keyword] [Variable name]: [Type] = [Initial value]
```

## Assignment

변경할 수 없는 (immutable) 변수를 정의할 때는 `const` 키워드를 사용한다.

```zig
const c_value: i32 = 33;
// c_value = 44; // 에러 발생
```

`const` 키워드를 사용한 변수의 값을 변경하려고 할 때는 컴파일 에러가 발생한다.

변경 가능한 (mutable) 변수를 정의할 때는 `var` 키워드를 사용한다.

```zig
var v_value: i32 = 33;
v_value = 44;
```

`var` 속성을 가진 변수의 값이 변경되지 않는다면 컴파일 에러가 발생한다. 변경되지 않을 값을 정의할 때는 `const`를 사용해야 한다.

`var` 변수가 처음에 정의될 때 특정 값을 할당하고 싶지 않을 때는 값으로 `undefined`를 준다. `undefined`는 나중에 무엇으로든 변화할 수 있는 값이다.

```zig
var undef_value: i32 = undefined;
undef_value = 55;
```

## Type

zig에는 다양한 데이터타입이 있다. [zig 공식 문서](https://ziglang.org/documentation/0.12.0/#Primitive-Types)에서 각 타입의 정보를 확인할 수 있다. 일반적으로 타입은 `{속성}{바이트 크기}`로 표현된다. 예를 들어 `i32`는 32비트 부호 있는 정수형, `f64`는 64비트 부동소수점형 타입을 나타낸다.

다음은 `f64`타입 변수를 정의하는 예시이다.

```zig
const g_acceleration: f64 = 9.80665;
```

변수를 정의할 때 타입을 명시하지 않을 수 있다. 이 경우, 할당된 값을 바탕으로 타입을 추론한다. 변수의 값으로 정수를 준다면 `comptime_int`, 부동소수점 수를 준다면 `comptime_float`로 추론된다. 문자열을 준다면 타입은 u8의 배열로 추론된다. `undefined`와 같은 값을 초기값으로 주면 컴파일 에러가 발생한다. 다음 예시는 타입을 명시하지 않고 변수를 선언하는 코드를 보여 준다.

```zig
const no_type_value = 3232;
// const no_type_value = 3232.3;
```

zig는 불리언 타입 `bool`도 가지고 있다. 참을 의미하는 값은 `true`, 거짓을 의미하는 값은 `false`이다.

```zig
const flag: bool = false; // true or false
```

이 섹션에 해당하는 예제 코드 전체는 `02_value.zig`이며 이 소스 파일은 다음과 같은 명령어로 실행한다.

```bash
zig run 02_value.zig
```

```
출력 결과
c_value: type i32, value 33
v_value = 44
g = 9.80665e0
no_type_value: type comptime_int, value 3232
```
