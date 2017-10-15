//
//  main.m
//  People
//
//  Created by 席银军 on 2017/10/14.
//  Copyright © 2017年 muhlenXi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSDictionary *dict = @{@"name" : @"苍井空",
                               @"age" : @18,
                               @"occupation" : @"老师",
                               @"nationality" : @"日本"
                               };
        
        // 字典转类型
        People *cang = [[People alloc] initWithDictionary:dict];
        NSLog(@"热烈欢迎，从%@远道而来的%@岁的%@%@",cang.nationality, cang.age, cang.name, cang.occupation);
        
        // 模型转字典
        NSDictionary *convertDict = [cang convertToDictionary];
        NSLog(@"convertDict == %@",convertDict);
        
    }
    return 0;
}
