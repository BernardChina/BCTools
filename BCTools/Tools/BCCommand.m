//
//  BCCommand.m
//  BCTools
//
//  Created by 刘勇强 on 2017/8/2.
//  Copyright © 2017年 刘勇强. All rights reserved.
//

#import "BCCommand.h"

@interface BCCommand()

@property (nonatomic, copy) void (^commandBlock)(id input);

@end

@implementation BCCommand

- (instancetype)initWithBlock:(void (^)(id input))block {
    if (self = [super init]) {
        _commandBlock = [block copy];
    }
    return self;
}

- (void)execute:(id)input {
    if (_commandBlock) {
        _commandBlock(input);
    }
}

@end
