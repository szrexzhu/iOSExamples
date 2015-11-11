//
//  ViewController.m
//  GetNowPlayingInfoExp
//
//  Created by rexzhu on 15/11/10.
//  Copyright © 2015年 rexzhu. All rights reserved.
//

#import "ViewController.h"

@import MediaPlayer;

@interface ViewController ()

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

- (void) currentPlayingInfo
{
//    MPMediaItem *item = [[MPMusicPlayerController iPodMusicPlayer] nowPlayingItem];//iPodMusicPlayer 8.0已经废弃，他能获取系统播放器的播放信息
    
    if ([MPMusicPlayerController respondsToSelector:@selector(systemMusicPlayer)]) {//7系统上怎么没这个方法
        MPMediaItem *item = [[MPMusicPlayerController systemMusicPlayer] nowPlayingItem];
        
        NSLog(@"%@", [item valueForProperty:MPMediaItemPropertyTitle]);
        NSLog(@">>>item=%@",item);
    }
    else
    {
        NSLog(@">>>不支持systemMusicPlayer。");
    }
    
    
    if ([MPMusicPlayerController respondsToSelector:@selector(applicationMusicPlayer)]) {
        MPMediaItem *item = [[MPMusicPlayerController applicationMusicPlayer] nowPlayingItem];
        
        NSLog(@"%@", [item valueForProperty:MPMediaItemPropertyTitle]);
        NSLog(@">>>applicationMusicPlayer item=%@",item);
    }
    else
    {
        NSLog(@">>>不支持applicationMusicPlayer。");
    }
    
}
- (IBAction)checkCurrentPlayingInfo:(id)sender {
    [self currentPlayingInfo];
}

@end
