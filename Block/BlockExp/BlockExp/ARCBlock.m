//
//  ARCBlock.m
//  BlockExp
//
//  Created by Abc on 15/11/21.
//  Copyright (c) 2015年 rexzhu. All rights reserved.
//

//#import "ARCBlock.h"
//
//@implementation ARCBlock
//
//- (void) blockTest
//{
//    ^ (void) {
//        NSLog(@"Rex test block!");
//    }();
//}
//
//@end




//如果使用Foundation.h中的东西，会产生特别多的代码不利于分析
//clang时怎么区分arc和非arc呢，使用了-fobjc-arc参数没效果



void block1()
{
    int a = 1;
    ^ (void) {
        int x = a;
        x++;
    }();
}

void block2()
{
    __block int a = 1;
    ^ (void) {
        a = 10;
    }();
}

void block3()
{
    __block int a = 1;
    void (^block1)(void) = ^ (void) {
        a = 10;
    };
    block1();
}



