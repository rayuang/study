// 引入头文件
#include <stdio.h>
#include <string.h>
// #define定义的标识符常量
#define MAX 10000
/*
主函数-入口-> 一个项目有且只有一个main函数
返回值类型 函数名()
{
    函数体
}
*/
// 全局变量定义 -> 变量访问局部优先
int a = 10;
int main()
{
    // 库函数printf() -> stdio.h
    printf("Hello World");
    // 数据类型
    // 变量的定义：主句类型 变量名 = 赋值 -> 变量可更改;
    int age = 18;
    char c = 'a';
    float fl = 10.5;
    printf("age = %d\t c = %c\t fl = %f\n", age, c, fl);
    // sizeof()返回所占空间字节大小
    printf("%d\t%d\t%d\t%d\t%d\t%d\t%d\n",
           sizeof(char),
           sizeof(short),
           sizeof(int),
           sizeof(long),
           sizeof(long long),
           sizeof(float),
           sizeof(double));
    // 不推荐使用scanf_s，此函数为vs编译器提供，其他编译器不通过
    scanf("%d%f", &age, &fl);
    printf("%d\t%f\n", age, fl);

    // 常量：字面常量
    10;
    'a';
    // const修饰的常变量
    const int number = 10;
    // 此时number即为常变量
    /*
    int arr = 10;
    int array[n] = {0};
    不可用使用变量为数组分配内存空间
    */
    //    使用#define定义的标识符常量
    printf("MAX = %d\n", MAX);
    // 枚举常量-> 可以一一列举的常量

    enum Season
    {
        // 枚举常量可以赋初值，后续常量自初值递增，如果没赋初值，默认从0开始
        SPRING = 2,
        SUMMER,
        AUTUMN,
        WINTER
    };

    // 枚举常量使用
    enum Season spring = SPRING;
    // 定义的枚举类型Season只能取所定义的常量值。
    printf("%d\n", spring);

    // 字符串 -> 字符春以\0结束，使用字符数组存储
    char char_arr[] = "helloword";
    printf("char_arr = %s\t %d\n", char_arr, sizeof(char_arr));
    // helloword  10
    char char_arr2[] = {'a', 'b', 'c', '\0'};
    /*必须要有\0，否则会出现乱码，是由于字符串没有结束位\0，
    计算机会一直在内存中寻找\0，
    所以如果没有结束位，字符串长度为随机值，
    字符串打印会将找到\0之前的字符全部打印。
    */
    printf("%s\n", char_arr2);
    // strlen()函数计算字符串长度并返回，字符串长度不包含结束位，即\0
    // 使用strlen()需要引入<string.h>头文件
    printf("%d\n", strlen("abc")); // 3
    return 0;
}