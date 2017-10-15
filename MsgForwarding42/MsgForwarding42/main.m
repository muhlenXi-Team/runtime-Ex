//
//  main.m
//  MsgForwarding42
//
//  Created by 席银军 on 2017/10/15.
//  Copyright © 2017年 muhlenXi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Person *cang = [[Person alloc] init];
        cang.name = @"苍老师";
        
        ((void (*)(id,SEL))objc_msgSend) ((id)cang, @selector(sing));
    }
    return 0;
}


