//
//  Person.m
//  MsgForwarding
//
//  Created by 席银军 on 2017/10/15.
//  Copyright © 2017年 muhlenXi. All rights reserved.
//

#import "Person.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation Person

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    // 我们没有给 person 类声明 sing 方法，我们这里动态添加方法
    if ([NSStringFromSelector(sel) isEqualToString:@"sing"]) {
        class_addMethod(self, sel, (IMP) otherSing, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
void otherSing(id self, SEL cmd) {
    NSLog(@"%@ 唱歌啦！",((Person *) self).name);
}

@end
