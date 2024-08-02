展示一些常见的 C++ 语言特性，包括宏定义、静态成员变量、条件编译、类的声明与实现、构造函数和析构函数，以及虚函数

## go

1.   `test.cpp`：

     ```cpp
     #include <stdio.h>
     
     #define MAX_LEN 1024
     #define print printf
     
     cdev* cdev::dev_self = NULL;
     
     cdev::devmgr() {
     
     }
     
     cdev::~devmgr() {
         dev_self = NULL;
     }
     
     int cdev::load(void* param) {
         dev* dev_self = (dev*)param;
         return 0;
     }
     
     void cdev::pload() {
         print("test");
     
     #ifdef A_TEST
         char *a = "abcd";
         if(a == "abcd") {
             print("%s", &a);
         }
     #endif
     
     }
     ```

     1. **包含头文件与宏定义**:

         ```cpp
         #include <stdio.h>
         
         #define MAX_LEN 1024
         #define print printf
         ```

         - `#include <stdio.h>`: 包含标准输入输出库，用于使用 `printf` 函数。
         - `#define MAX_LEN 1024`: 宏定义，将 `MAX_LEN` 定义为 1024。
         - `#define print printf`: 宏定义，将 `print` 替换为 `printf`，便于后续代码书写。

     2. **静态成员初始化**:

         ```cpp
         cdev* cdev::dev_self = NULL;
         ```

         - `cdev::dev_self` 是 `cdev` 类的一个静态成员变量，在类外进行初始化，初始值为 `NULL`。

     3. **构造函数与析构函数**:

         ```cpp
         cdev::devmgr() {
         
         }
         
         cdev::~devmgr() {
             dev_self = NULL;
         }
         ```

         - `cdev::devmgr()` 是构造函数，但在此代码中未执行任何操作。
         - `cdev::~devmgr()` 是析构函数，当对象销毁时，将静态成员 `dev_self` 置为 `NULL`。

     4. **成员函数 `load`**:

         ```cpp
         int cdev::load(void* param) {
             dev* dev_self = (dev*)param;
             return 0;
         }
         ```

         - `load` 是 `cdev` 类的一个成员函数，接收一个 `void*` 类型的参数 `param`。
         - 将 `param` 强制转换为 `dev*` 类型并赋值给 `dev_self`。
         - 返回 0。

     5. **成员函数 `pload`**:

         ```cpp
         void cdev::pload() {
             print("test");
         
         #ifdef A_TEST
             char *a = "abcd";
             if(a == "abcd") {
                 print("%s", &a);
             }
         #endif
         }
         ```

         - `pload` 是 `cdev` 类的一个成员函数，调用 `print`（即 `printf`）输出 "test"。
         - `#ifdef A_TEST` 条件编译，如果定义了 `A_TEST`，则执行以下代码：
             - 定义字符指针 `a` 并指向字符串 `"abcd"`。
             - 检查 `a` 是否等于 `"abcd"`，此处比较的是指针地址而非字符串内容（这是不正确的做法）。
             - 使用 `print` 输出 `a` 的地址。

2.   `test.h`：

     ```cpp
     #ifndef __CDEV_H__
     #define __CDEV_H__
     
     class cdev:public cbase {
         public:
             virtual ~cdev();
     
             int load(void* param);
     
         private:
             static cdev* dev_self;
             cdev();
     
             int pload();
     }
     ```

     1. **头文件保护**:

         ```cpp
         #ifndev __CDEV_H__
         #define __CDEV_H__
         ```

         - 头文件保护，用于防止头文件被重复包含。

     2. **类声明**:

         ```cpp
         class cdev:public cbase {
             public:
                 virtual ~cdev();
         
                 int load(void* param);
         
             private:
                 static cdev* dev_self;
                 cdev();
         
                 int pload();
         }
         ```

         - 声明 `cdev` 类，并公有继承自 `cbase` 类。
         - 公有成员：
             - 析构函数 `~cdev()`，声明为虚函数（`virtual`），用于确保正确调用子类的析构函数。
             - 成员函数 `load`，接收一个 `void*` 参数。
         - 私有成员：
             - 静态成员变量 `dev_self`，指向 `cdev` 类型的指针
             - 构造函数 `cdev`
             - 成员函数 `pload`
         - 公有成员在外可以直接访问、修改，私有成员无法直接访问和修改，需要通过类里定义的函数例如 `get_private_member()` 来访问和修改