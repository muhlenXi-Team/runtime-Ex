//
//  Person+Associated.m
//  Person
//
//  Created by 席银军 on 2017/10/14.
//  Copyright © 2017年 muhlenxi. All rights reserved.
//

#import "Person+Associated.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif


@implementation Person (Associated)

- (void) setAssociatedBust:(NSNumber *) associatedBust {
    // 设置关联对象
    objc_setAssociatedObject(self, @selector(associatedBust), associatedBust, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (NSNumber *)associatedBust {
    return objc_getAssociatedObject(self, @selector(associatedBust));
}

- (void)setAssociatedCallBack:(CodingCallBack)associatedCallBack {
    objc_setAssociatedObject(self, @selector(associatedCallBack), associatedCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CodingCallBack)associatedCallBack {
    return objc_getAssociatedObject(self, @selector(associatedCallBack));
}

@end
