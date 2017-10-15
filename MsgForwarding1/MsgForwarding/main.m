//
//  main.m
//  MsgForwarding
//
//  Created by 席银军 on 2017/10/15.
//  Copyright © 2017年 muhlenXi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Person *cang = [[Person alloc] init];
        cang.name = @"苍老师";
        [cang sing];
    }
    return 0;
}
