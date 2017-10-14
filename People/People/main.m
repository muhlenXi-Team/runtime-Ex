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
        
        People *teacherCang = [[People alloc] init];
        teacherCang.name = @"苍井空";
        teacherCang.age = @18;
        teacherCang.occupation = @"老师";
        teacherCang.nationality = @"日本";
        
        NSString *path = NSHomeDirectory();
        path = [NSString stringWithFormat:@"%@/teacherCang",path];
        
        NSLog(@"Path == %@", path);
        
        // 归档
        [NSKeyedArchiver archiveRootObject:teacherCang toFile:path];
        
        // 解档
        People *teacher = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        NSLog(@"热烈欢迎，从 %@ 远道而来的 %@ 岁的 %@%@",teacher.nationality, teacher.age, teacher.name, teacher.occupation);
        
    }
    return 0;
}
