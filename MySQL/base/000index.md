"sqlstate_value重点"
Database Management System  DBMS 数据库管理系统
Relational Database Management System RDBMS  关系型数据库管理系统
{
    键值型数据库
    文档型数据库
    搜索引擎数据库
    列式数据库
    图形数据库
}

Entity-Relationship Model E-R模型  实体-联系（关系） 模型
{
    实体集
    属性
    联系集
}
表的关联关系
{
    one to one 一对一
    one to many 一对多
    many to many 多对多
    self reference 自我引用
}
MySQL Version
{
    MySQL Community Server 社区版本
    MySQL Enterprise Edition 企业版本
    MySQL Cluster 集群版
    MySQL Cluster CGE高级集群版
}
Terminal
{
    ```sql
    启动 MySQL服务  net start MySQL 服务名
    停止 MySQL服务  net stop MySQL 服务名
    登录    mysql -uroot 【-P端口号】  -ppassword（明文）
    （mysql -uroot 【-P端口号】 -p 回车并输入密码（密文））
    {
        -ppassword中间不能有空格，其他参数属性之间的都可以
    }
    退出    quit/exit
    查看版本 mysql --version
    ```
}

数据表必备四字段{
    id
    gmt_create
    gmt_modified
    is_deleted
}