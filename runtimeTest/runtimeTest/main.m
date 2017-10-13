//
//  main.m
//  runtimeTest
//
//  Created by 席银军 on 2017/10/13.
//  Copyright © 2017年 muhlenxi. All rights reserved.
//


#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

#import <Foundation/Foundation.h>

// 自定义一个方法
void sayFunction(id self, SEL _cmd, id some) {
    
    NSLog(@"%@ 岁的 %@ 说：%@",object_getIvar(self, class_getInstanceVariable([self class], "_age")), [self valueForKey:@"name"], some);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        // 动态创建类对象 创建一个 Person 继承自 NSObject 类
        Class Person = objc_allocateClassPair([NSObject class], "Person", 0);
        
        // 为该类添加 NSString *_name 成员变量
        class_addIvar(Person, "_name", sizeof(NSString*), log2(sizeof(NSString*)), @encode(NSString*));
        class_addIvar(Person, "_age", sizeof(int), sizeof(int), @encode(int));
        
        // 注册方法名为 say 的方法
        SEL s = sel_registerName("say:");
        // 为该类增加名为 say 的方法
        class_addMethod(Person, s, (IMP) sayFunction, "v@:@");
        
        // 注册该类
        objc_registerClassPair(Person);
        
        // 创建一个类的实例
        id personInstance = [[Person alloc] init];
        
        // KVC 动态改变 personInstance 中的实例变量
        [personInstance setValue:@"苍老师" forKey:@"name"];
        
        // 从类中获取成员变量 Ivar
        Ivar ageIvar = class_getInstanceVariable(Person, "_age");
        // 为 peopleInstance 的成员变量赋值
        object_setIvar(personInstance, ageIvar, @18);
        
        // 调用 personInstance 对象的 s 方法
        ((void (*)(id, SEL, id))objc_msgSend)(personInstance, s, @"大家好");
        
        personInstance = nil;
        
        // 销毁类
        objc_disposeClassPair(Person);
        
    }
    return 0;
}
