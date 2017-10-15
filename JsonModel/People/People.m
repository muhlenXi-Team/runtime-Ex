//
//  People.m
//  People
//
//  Created by 席银军 on 2017/10/14.
//  Copyright © 2017年 muhlenXi. All rights reserved.
//

#import "People.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif


@implementation People

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self =  [super init];
    if (self) {
        for (NSString *key in dict.allKeys) {
            id value = dict[key];
            SEL setter = [self propertySetterByKey:key];
            if (setter) {
                ((void (*) (id, SEL, id))objc_msgSend)(self, setter, value);
            }
        }
    }
    return self;
}

- (NSDictionary *)convertToDictionary {
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    if (count != 0) {
        NSMutableDictionary * resultDic = [@{} mutableCopy];
        for (NSUInteger i = 0; i < count; i++) {
            const void *propertyName = property_getName(properties[i]);
            NSString *name = [NSString stringWithUTF8String:propertyName];
            SEL getter = [self propertyGetterByKey:name];
            if (getter) {
                id value = ((id (*)(id, SEL))objc_msgSend)(self, getter);
                if (value) {
                    resultDic[name] = value;
                } else {
                    resultDic[name] = @"Value can not nil!";
                }
            }
            
        }
        free(properties);
        return resultDic;
    }
    free(properties);
    return nil;
}

#pragma mark - private methods

- (SEL) propertySetterByKey:(NSString *) key {
    NSString * propertySetterName = [NSString stringWithFormat:@"set%@:",key.capitalizedString];
    SEL setter = NSSelectorFromString(propertySetterName);
    if ([self respondsToSelector:setter]) {
        return setter;
    }
    return nil;
}

- (SEL) propertyGetterByKey:(NSString *) key {
    SEL getter = NSSelectorFromString(key);
    if ([self respondsToSelector:getter]) {
        return getter;
    }
    return nil;
}

@end
