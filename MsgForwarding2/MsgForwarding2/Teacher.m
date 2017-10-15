//
//  Teacher.m
//  MsgForwarding1
//
//  Created by 席银军 on 2017/10/15.
//  Copyright © 2017年 muhlenXi. All rights reserved.
//

#import "Teacher.h"
#import "Bird.h"

@implementation Teacher

// 第一步：不动态添加方法，返回 NO
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return NO;
}

// 第二步：指定备选对象响应
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"sing"]) {
        Bird *bird = [[Bird alloc] init];
        bird.name = @"小麻雀";
        return bird;
    }
    return nil;
}

@end
