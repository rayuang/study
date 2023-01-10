#include <stdio.h>

int main()
{
    // 选择语句
    int num = 1;
    if (num == 1)
    {
        printf("num = 1\n");
    }
    else
    {
        printf("num != 1\n");
    }
    // 循环语句
    while (num < 10)
    {
        printf("num = %d\n", num);
        num++;
    }
    int arr[10] = {5, 6, 1, 4, 8, 5, 4, 5, 9, 5};

    for (int i = 0; i < sizeof(arr) / sizeof(int); i++)
    {
        printf("num = %d\t", arr[i]);
    }

    return 0;
}