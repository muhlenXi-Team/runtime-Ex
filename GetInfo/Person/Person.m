//
//  Person.m
//  Person
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



#import "Person.h"

@implementation Person

- (NSDictionary *)allIvars {
    unsigned int count = 0;
    
    NSMutableDictionary *resultDic = [@{} mutableCopy];
    
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (NSUInteger i = 0; i < count; i++) {
        const char *varName = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:varName];
        id varValue = [self valueForKey:name];
        if (varValue) {
            resultDic[name] = varValue;
        } else {
            resultDic[name] = @"Ivar value can not nil.";
        }
    }
    free(ivars);
    
    return resultDic;
}

- (NSDictionary *) allProperties {
    unsigned int count = 0;
    NSMutableDictionary *resultDic = [NSMutableDictionary dictionary];
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (NSUInteger i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        if (propertyValue) {
            resultDic[name] = propertyValue;
        } else {
            resultDic[name] = @"Property value can not nil.";
        }
    }
    free(properties);
    
    return resultDic;
}

- (NSDictionary *) allMethods {
    unsigned int count = 0;
    NSMutableDictionary *resultDic = [NSMutableDictionary dictionary];
    
    Method *methods = class_copyMethodList([self class], &count);
    
    for (NSUInteger i = 0; i < count; i++) {
        
        // 获取方法名称
        SEL methodSEL = method_getName(methods[i]);
        const char *methodName = sel_getName(methodSEL);
        NSString *name = [NSString stringWithUTF8String:methodName];
        
        // 获取方法的参数列表
        int arguments = method_getNumberOfArguments(methods[i]);
        
        resultDic[name] = @ (arguments - 2);
        
    }
    free(methods);
    
    return resultDic;
}

@end
