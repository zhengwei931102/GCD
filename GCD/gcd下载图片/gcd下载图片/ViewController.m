//
//  ViewController.m
//  gcd下载图片
//
//  Created by stu074 on 16/3/21.
//  Copyright © 2016年 stu074. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize iv;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.iv = [[UIImageView alloc] initWithFrame:CGRectMake(120, 120, 100, 100)];
    [self.view addSubview:self.iv];
}
- (IBAction)downImage:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *url = @"http://e.hiphotos.baidu.com/zhidao/pic/item/78310a55b319ebc40bbc7c3e8326cffc1f171654.jpg";
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
        UIImage *image= [[UIImage alloc] initWithData:data];
        if (image!=nil) {
           dispatch_async(dispatch_get_main_queue(), ^{
               self.iv.image = image;
           });
            
        } else{
            NSLog(@"--下载图片出现错误－－");
        }

    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
