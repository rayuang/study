// 导入iostream头文件
#include <iostream>
// 使用命名空间std
using namespace std;
// #define定义宏常量
#define MAX 10
// 主函数-> 有且只有一个
int main()
{
    cout << "HelloWorld" << endl;

    // 数据类型,同c
    int num = 10;
    cout << "num=" << num << endl;
    // const修饰的变量-> 常量
    const int number = 20;
    cout << "MAX=" << MAX << "\t"
         << "number=" << number << endl;
    return 0;
}