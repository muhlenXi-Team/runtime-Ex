# runtime-Ex

id 表示一个类的实例（对象），是一个指向 objc_object 结构体的指针。

Class 表示一个类，其中 isa 是一个指向 objc_class 结构体的指针。

SEL 是指向 objc_selector 结构体的指针，用于表示方法的特征。

IMP ，编译器生成的函数指针，指向要执行的代码入口。

### Task1：

*动态创建一个类，并创建成员变量和方法，最后给成员变量赋值并发送消息。*

[demo1 传送门](https://github.com/YinjunXi/runtime-Ex/tree/master/runtimeTest)

### Task2:

*如何获取对象所有的属性名称和属性值、获取对象所有成员变量名称和变量值、获取对象所有的方法名和方法参数数量。*

[demo2 传送门](https://github.com/YinjunXi/runtime-Ex/tree/master/Person)

### Task3：

*通过 Category 和 Associated objects 添加属性。*

[demo3 传送门](https://github.com/YinjunXi/runtime-Ex/tree/master/Person)

### Task4:

*对象的 归档 和 解档。*

[demo4 传送门](https://github.com/YinjunXi/runtime-Ex/tree/master/People)