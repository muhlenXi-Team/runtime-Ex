//
//  Person.h
//  Person
//
//  Created by 席银军 on 2017/10/13.
//  Copyright © 2017年 muhlenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_occupation;
    NSString *_nationality;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger age;

- (NSDictionary *) allIvars;
- (NSDictionary *) allProperties;
- (NSDictionary *) allMethods;

@end
