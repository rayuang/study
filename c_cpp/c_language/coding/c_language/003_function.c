#include <stdio.h>

int sum_num(int a,int b);
int main()
{
    int sum = sum_num(3,8);
    printf("sum = %d\n",sum);
    return 0;
}

int sum_num(int a,int b)
{
    int num = a + b;
    return num;
}