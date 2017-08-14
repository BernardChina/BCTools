//
//  BCCommand.h
//  BCTools
//
//  Created by 刘勇强 on 2017/8/2.
//  Copyright © 2017年 刘勇强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCCommand : NSObject

- (instancetype)initWithBlock:(void (^)(id input))block;

- (void)execute:(id)input;

@end
