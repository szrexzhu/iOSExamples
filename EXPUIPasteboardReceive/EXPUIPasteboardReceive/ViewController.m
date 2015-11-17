//
//  ViewController.m
//  EXPUIPasteboardReceive
//
//  Created by rexzhu on 15/11/12.
//  Copyright © 2015年 rexzhu. All rights reserved.
//

#import "ViewController.h"

static NSString * const PasteboardName = @"EXPUIPasteboard";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *systemPasteboardContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *customPasteboardContentLabel;

@property (strong,nonatomic) NSTimer *myTimer;
@end




///////////////////关于剪切板数据存储位置
//http://stackoverflow.com/questions/33539624/where-does-uipasteboard-store-data
//Pasteboard is managed by com.apple.UIKit.pasteboardd daemon located at /System/Library/Frameworks/UIKit.framework/Support/pasteboardd. It doesn't run all the time, only when somebody actually needs it i.e. uses copy/paste.
//
//It does use a persistent storage - /var/mobile/Library/Caches/com.apple.UIKit.pboard/pasteboardDB binary property list. Even if you SIGKILL the daemon it will restore the pasteboard contents from the database.
//
//pasteboardDB root object is NSArray. Each element is a NSDictionary object that's bound to specific bundle id and name. For example, general copy/paste uses shared storage - dictionary has bundle->com.apple.UIKit.pboard and name->com.apple.UIKit.pboard.general keys. Under items key there is an array of pasteboard items. Yoy can try to copy some text and you will find it there as unencrypted UTF8 string stored as NSData object.


 
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testNotification];
    
    //增加定时器监视发送方卸载后，数据能存多久。>>结论：在app卸载后只要一会不去访问就被清除了。
//    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(checkPasteboard) userInfo:nil repeats:YES];
}

- (void) checkPasteboard
{
    UIPasteboard *board = [UIPasteboard pasteboardWithName:PasteboardName create:NO];
    if (board == nil) {
        [self showTipsAndStopTimer];
        return;
    }
    
    if (board.string == nil) {
        [self showTipsAndStopTimer];
    }
    else
    {
        NSLog(@">>>%@",board.string);
    }
}

- (void) showTipsAndStopTimer
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tips" message:[[NSDate date] description] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    [self.myTimer invalidate];
    self.myTimer = nil;
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
    UIPasteboard *board = [UIPasteboard pasteboardWithName:PasteboardName create:NO];//获取这个在7.1系统上测试也没有Bundle Identifier前缀相同的限制?>>要求的是Team相同，都是用自己的Apple ID。误会了
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
