//
//  ViewController.m
//  EXPUIPasteboardReceive
//
//  Created by rexzhu on 15/11/12.
//  Copyright © 2015年 rexzhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *systemPasteboardContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *customPasteboardContentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)expGetSystemPasteboardContent:(id)sender {
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    self.systemPasteboardContentLabel.text = board.string;
}
- (IBAction)expGetCumtomPasteboardContent:(id)sender {
    UIPasteboard *board = [UIPasteboard pasteboardWithName:@"EXPUIPasteboard" create:YES];//获取这个在7.1系统上测试也没有Bundle Identifier前缀相同的限制?>>要求的是Team相同，都是用自己的Apple ID。误会了
    self.customPasteboardContentLabel.text = board.string;
}

- (void) testNotification
{
    //结果收不到任何通知，看网络结论只能通过定时检查pasteboard来判断
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveUIPasteboardChangedNotification:) name:UIPasteboardChangedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveUIPasteboardChangedTypesAddedKey:) name:UIPasteboardChangedTypesAddedKey object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveUIPasteboardChangedTypesRemovedKey:) name:UIPasteboardChangedTypesRemovedKey object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveUIPasteboardRemovedNotification:) name:UIPasteboardRemovedNotification object:nil];
}

- (void) receiveUIPasteboardChangedNotification:(NSNotification *) notification
{
    NSLog(@"UIPasteboardChangedNotification UserInfo=%@",notification.userInfo);
}

- (void) receiveUIPasteboardChangedTypesAddedKey:(NSNotification *) notification
{
    NSLog(@"UIPasteboardChangedTypesAddedKey UserInfo=%@",notification.userInfo);
}

- (void) receiveUIPasteboardChangedTypesRemovedKey:(NSNotification *) notification
{
    NSLog(@"UIPasteboardChangedTypesRemovedKey UserInfo=%@",notification.userInfo);
}

- (void) receiveUIPasteboardRemovedNotification:(NSNotification *) notification
{
    NSLog(@"UIPasteboardRemovedNotification UserInfo=%@",notification.userInfo);
}

@end
