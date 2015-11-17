//
//  ViewController.m
//  EXPUIPasteboardSend
//
//  Created by rexzhu on 15/11/11.
//  Copyright © 2015年 rexzhu. All rights reserved.
//

#import "ViewController.h"

static NSString * const PasteboardName = @"EXPUIPasteboard";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *contentField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendToPasteboard:(id)sender {
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    board.string = self.contentField.text;
}

- (IBAction)sentToCustomPasteboard:(id)sender {
    UIPasteboard *board = [UIPasteboard pasteboardWithName:PasteboardName create:YES];
    board.persistent = YES;//无论删除app，重启手机都在，这太好了。>>事实上存不了多久
    board.string = self.contentField.text;
}
- (IBAction)deleteCustomPasteboard:(id)sender {
    [UIPasteboard removePasteboardWithName:PasteboardName];
}
@end
