//
//  main.m
//  MsgForwarding41
//
//  Created by 席银军 on 2017/10/15.
//  Copyright © 2017年 muhlenXi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bird.h"

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
        
        Bird *bird = [[Bird alloc] init];
        bird.name = @"小小鸟";
        
        ((void (*)(id,SEL))objc_msgSend) ((id)bird, @selector(sing));
        
    }
    return 0;
}
