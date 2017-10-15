//
//  Bird.m
//  MsgForwarding41
//
//  Created by 席银军 on 2017/10/15.
//  Copyright © 2017年 muhlenXi. All rights reserved.
//

#import "Bird.h"
#import "Person.h"

@implementation Bird

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

// 第四步：修改调用对象
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // 修改调用对象为 Person
    Person *person = [[Person alloc] init];
    person.name = @"苍老师";
    [anInvocation invokeWithTarget:person];
}

@end
