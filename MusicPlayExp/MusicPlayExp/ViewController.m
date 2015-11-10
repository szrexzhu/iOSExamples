//
//  ViewController.m
//  MusicPlayExp
//
//  Created by rexzhu on 15/11/10.
//  Copyright © 2015年 rexzhu. All rights reserved.
//

#import "ViewController.h"

@import AVFoundation;
@import MediaPlayer;

@interface ViewController ()
{
    AVAudioPlayer *_player;
}

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
- (IBAction)play:(id)sender {
    if (_player && [_player isPlaying]) {
        return;
    }
    
    if (!_player) {
        NSString *filePathString = [[NSBundle mainBundle] pathForResource:@"YiJianMei" ofType:@"mp3"];
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePathString];
        if (isExist) {
            _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:filePathString] error:nil];
            _player.numberOfLoops = NSIntegerMin;//负数为无限循环
        }
        else
        {
            NSLog(@"找不到音乐文件!");
        }
    }
    
    [_player play];
}
- (IBAction)pause:(id)sender {
    [_player pause];
}
- (IBAction)stop:(id)sender {
    [_player stop];
}
- (IBAction)configPlayingInfo:(id)sender {
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self configNowPlayingInfoCenter];
}


-(void)configNowPlayingInfoCenter
{
    //自己App获取播放信息还是可以的
    //因为defaultCenter是当前应用的，所以获取的信息是当前应用的播放信息
    //// Returns the default now playing info center.
    // The default center holds now playing info about the current application.
    //+ (MPNowPlayingInfoCenter *)defaultCenter;
//    static BOOL isConfig = NO;
//    if (isConfig) {
//        NSDictionary *dict = [[MPNowPlayingInfoCenter defaultCenter] nowPlayingInfo];
//        NSLog(@"########get info:%@",dict);
//        return;
//    }
//    isConfig = YES;
    
    if (NSClassFromString(@"MPNowPlayingInfoCenter")) {
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:@"一剪梅" forKey:MPMediaItemPropertyTitle];
        [dict setObject:@"费玉清" forKey:MPMediaItemPropertyArtist];
        [dict setObject:@"album" forKey:MPMediaItemPropertyAlbumTitle];
        [dict setObject:@(240) forKey:MPMediaItemPropertyPlaybackDuration];
        [dict setObject:@"歌手：张明敏\r\n\
         一剪梅lrc歌词：\r\n\
         [ti:一剪梅]\r\n\
         [ar:张明敏]\r\n\
         [al:]\r\n\
         [by:mp3.5nd.com]\r\n\
         [00:05.85]一剪梅\r\n\
         [00:19.67]\r\n\
         [00:26.73]真情像草原广阔\r\n\
         [00:33.65]层层风雨不能阻隔\r\n\
         [00:40.73]总有云开 日出时候" forKey:MPMediaItemPropertyLyrics];//怎么没效果？MPNowPlayingInfoCenter.h文件前边列的支持类型里没有这个
        
        UIImage *image = [UIImage imageNamed:@"feiyuqing.jpeg"];
        MPMediaItemArtwork *artwork = [[MPMediaItemArtwork alloc] initWithImage:image];
        [dict setObject:artwork forKey:MPMediaItemPropertyArtwork];
        
        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:dict];
        
    }
    
}


//-(BOOL)canBecomeFirstResponder{
//    return YES;
//}

-(void)remoteControlReceivedWithEvent:(UIEvent *)event{
    
    //if it is a remote control event handle it correctly
    if (event.type == UIEventTypeRemoteControl) {
        switch (event.subtype) {
            case UIEventSubtypeRemoteControlTogglePlayPause:
            {
                NSLog(@"UIEventSubtypeRemoteControlTogglePlayPause...");
                
                [self pause:nil];
                
                break;
            }
            case UIEventSubtypeRemoteControlPlay:
            {
                NSLog(@"UIEventSubtypeRemoteControlPlay...");
                
                [self play:nil];
                
                break;
            }
            case UIEventSubtypeRemoteControlPause:
            {
                NSLog(@"UIEventSubtypeRemoteControlPause...");
                
                [self pause:nil];
                
                break;
            }
            case UIEventSubtypeRemoteControlStop:
            {
                NSLog(@"UIEventSubtypeRemoteControlStop...");
                
                [self stop:nil];
                
                break;
            }
            case UIEventSubtypeRemoteControlNextTrack:
            {
                NSLog(@"UIEventSubtypeRemoteControlNextTrack...");
                break;
            }
            case UIEventSubtypeRemoteControlPreviousTrack:
            {
                NSLog(@"UIEventSubtypeRemoteControlPreviousTrack...");
                break;
            }
                
            default:
                break;
        }
    }
    
}

@end
