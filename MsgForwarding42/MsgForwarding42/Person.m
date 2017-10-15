//
//  Person.m
//  MsgForwarding42
//
//  Created by 席银军 on 2017/10/15.
//  Copyright © 2017年 muhlenXi. All rights reserved.
//

#import "Person.h"

@implementation Person

// 第一步：不动态添加方法
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    return NO;
}

// 第二步：不指定备选对象
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}

// 第三步：返回方法选择器
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    if ([NSStringFromSelector(aSelector) isEqualToString:@"sing"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

// 第四步：修改调用方法
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // 修改调用方法为 dance
    
    [anInvocation setSelector:@selector(dance)];
    
    [anInvocation invokeWithTarget:self];
}

- (void) dance {
    NSLog(@"%@ 跳舞啦。。。",self.name);
}

// 若 forwardInvocation 没有实现，则会调用此方法。
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"消息无法处理：%@",NSStringFromSelector(aSelector));
}

@end
