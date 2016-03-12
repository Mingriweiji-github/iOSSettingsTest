//
//  ViewController.m
//  Test
//
//  Created by MAC on 15/12/13.
//  Copyright © 2015年 airmedia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //测试------第一步info-urltype增加scheme ---prefs
    UIButton *setting = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 100, 100)];
    [setting setTitle:@"设置" forState:UIControlStateNormal];
    [setting setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [setting addTarget:self action:@selector(gotoWeChat) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:setting];
    
    

    
    
}

- (void)gotoWeChat
{
    //测试二部曲
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURL *url = [NSURL URLWithString:@"weixin://qr/JnXv90fE6hqVrQOU9yA0"];
    
    //weixin://qr/JnXv90fE6hqVrQOU9yA0
    //mqq://im/chat?chat_type=wpa&uin=869918615&version=1&src_type=web
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //    webView.delegate = self;
    [webView loadRequest:request];
    [self.view addSubview:webView];
}
//第二步
- (void)gotoSetting
{
//    跳转app设置
//    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//    
//    if([[UIApplication sharedApplication] canOpenURL:url]) {
//        
//        NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
//        
//        [[UIApplication sharedApplication] openURL:url];
//        
//    }
    
    //跳转设置
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=INTERNET_TETHERING"]];
    
    //跳转WIFI
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=WIFI"]];
    

    //蓝牙
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Bluetooth"]];
    
  //Safari浏览器
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Safari"]];
    
    //直接打开VPN
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=VPN"]];
    
//    跳转到其他的界面的字段修改prefs:root=
//    
//    About — prefs:root=General&path=About
//    
//    Accessibility — prefs:root=General&path=ACCESSIBILITY
//    
//    AirplaneModeOn— prefs:root=AIRPLANE_MODE
//    
//    Auto-Lock — prefs:root=General&path=AUTOLOCK
//    
//    Brightness — prefs:root=Brightness
//    
//    Bluetooth — prefs:root=General&path=Bluetooth
//    
//    Date& Time — prefs:root=General&path=DATE_AND_TIME
//    
//    FaceTime — prefs:root=FACETIME
//    
//    General— prefs:root=General
//    
//    Keyboard — prefs:root=General&path=Keyboard
//    
//    iCloud — prefs:root=CASTLE  iCloud
//    
//    Storage & Backup — prefs:root=CASTLE&path=STORAGE_AND_BACKUP
//    
//    International — prefs:root=General&path=INTERNATIONAL
//    
//    Location Services — prefs:root=LOCATION_SERVICES
//    
//    Music — prefs:root=MUSIC
//    
//    Music Equalizer — prefs:root=MUSIC&path=EQ
//    
//    Music VolumeLimit— prefs:root=MUSIC&path=VolumeLimit
//    
//    Network — prefs:root=General&path=Network
//    
//    Nike + iPod — prefs:root=NIKE_PLUS_IPOD
//    
//    Notes — prefs:root=NOTES
//    
//    Notification — prefs:root=NOTIFICATIONS_ID
//    
//    Phone — prefs:root=Phone
//    
//    Photos — prefs:root=Photos
//    
//    Profile — prefs:root=General&path=ManagedConfigurationList
//    
//    Reset — prefs:root=General&path=Reset
//    
//    Safari — prefs:root=Safari  Siri — prefs:root=General&path=Assistant
//    
//    Sounds — prefs:root=Sounds
//    
//    SoftwareUpdate— prefs:root=General&path=SOFTWARE_UPDATE_LINK
//    
//    Store — prefs:root=STORE
//    
//    Twitter — prefs:root=TWITTER
//    
//    Usage — prefs:root=General&path=USAGE
//    
//    VPN — prefs:root=General&path=Network/VPN
//    
//    Wallpaper — prefs:root=Wallpaper
//    
//    Wi-Fi — prefs:root=WIFI
//    
//    Setting—prefs:root=INTERNET_TETHERING
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
