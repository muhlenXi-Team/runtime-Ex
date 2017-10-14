//
//  Person+Associated.h
//  Person
//
//  Created by 席银军 on 2017/10/14.
//  Copyright © 2017年 muhlenxi. All rights reserved.
//

#import "Person.h"

typedef void (^CodingCallBack) (void);

@interface Person (Associated)

@property (nonatomic, strong) NSNumber *associatedBust;  //!< 胸围
@property (nonatomic, copy) CodingCallBack associatedCallBack; //!< 写代码

@end
