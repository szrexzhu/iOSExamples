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
    UIPasteboard *board = [UIPasteboard pasteboardWithName:@"EXPUIPasteboard" create:YES];//获取这个在7.1系统上测试也没有Bundle Identifier前缀相同的限制?
    self.customPasteboardContentLabel.text = board.string;
}

@end
