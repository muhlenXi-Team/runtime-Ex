//
//  main.m
//  Person
//
//  Created by 席银军 on 2017/10/13.
//  Copyright © 2017年 muhlenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Person *cang = [[Person alloc] init];
        cang.name = @"苍井空";
        cang.age = 18;
        [cang setValue:@"老师" forKey:@"occupation"];
        
        NSDictionary *propertyDic = [cang allProperties];
        NSLog(@"%@", propertyDic);
        
        NSDictionary *ivarDic = [cang allIvars];
        NSLog(@"%@",ivarDic);
        
        NSDictionary *methodDic = [cang allMethods];
        NSLog(@"%@",methodDic);
    }
    return 0;
}
