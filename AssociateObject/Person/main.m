//
//  main.m
//  Person
//
//  Created by 席银军 on 2017/10/13.
//  Copyright © 2017年 muhlenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Associated.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Person *cang = [[Person alloc] init];
        cang.name = @"苍井空";
        cang.age = 18;
        cang.occupation = @"老师";
        cang.nationality = @"日本";
        
        // category 关联属性
        cang.associatedBust = @90;
        cang.associatedCallBack = ^(){
            NSLog(@"苍老师要写代码了！");
        };
        
        cang.associatedCallBack();
        
        NSLog(@"bust == %@",cang.associatedBust);
        
    }
    return 0;
}
