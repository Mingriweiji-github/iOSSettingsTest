//
//  ViewController.m
//  Test
//
//  Created by MAC on 15/12/13.
//  Copyright © 2015年 airmedia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //测试------第一步info-urltype增加scheme ---prefs
    UIButton *setting = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 100, 100)];
    [setting setTitle:@"设置" forState:UIControlStateNormal];
    [setting setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [setting addTarget:self action:@selector(gotoSetting) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:setting];
    
    
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
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=WIFI"]];
    

    //蓝牙
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Bluetooth"]];
    
  //Safari浏览器
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Safari"]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
