//
//  ExamplesFromInternet.m
//  BlockExp
//
//  Created by Abc on 15/11/22.
//  Copyright (c) 2015年 rexzhu. All rights reserved.
//

#import "ExamplesFromInternet.h"


//例子来自http://blog.parse.com/learn/engineering/objective-c-blocks-quiz/


@implementation ExamplesFromInternet

+ (void) exampleB_addBlockToArray:(NSMutableArray *)array
{
    char b = 'B';
    [array addObject:^{
        printf("%cn", b);
    }];
}

+ (void) exampleB
{
    NSMutableArray *array = [NSMutableArray array];
    [ExamplesFromInternet exampleB_addBlockToArray:array];
    void (^block)() = [array objectAtIndex:0];
    block();
}


+ (void) exampleC_addBlockToArray:(NSMutableArray *)array {
    [array addObject:^{
        printf("Cn");
    }];
}

+ (void) exampleC {
    NSMutableArray *array = [NSMutableArray array];
    [ExamplesFromInternet exampleC_addBlockToArray:array];
    void (^block)() = [array objectAtIndex:0];
    block();
}

@end

