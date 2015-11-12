//
//  ViewController.m
//  EXPUIPasteboardSend
//
//  Created by rexzhu on 15/11/11.
//  Copyright © 2015年 rexzhu. All rights reserved.
//

#import "ViewController.h"

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
    UIPasteboard *board = [UIPasteboard pasteboardWithName:@"EXPUIPasteboard" create:YES];
    board.string = self.contentField.text;
}
@end
