//
//  ViewController.m
//  gcdDEMO
//
//  Created by stu074 on 16/3/21.
//  Copyright © 2016年 stu074. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
dispatch_queue_t serialQueue;
dispatch_queue_t concurrentQueue;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    serialQueue = dispatch_queue_create("fkjava.queue", DISPATCH_QUEUE_SERIAL);
    concurrentQueue = dispatch_queue_create("fkjava.queue", DISPATCH_QUEUE_CONCURRENT);
}
- (IBAction)serial:(id)sender {
    dispatch_async(serialQueue, ^{
        for(int i=0;i<100;i++){
            NSLog(@"%@=====%d",[NSThread currentThread],i);
        }
    });
    dispatch_async(serialQueue, ^{
        for(int i=0;i<100;i++){
            NSLog(@"%@-----%d",[NSThread currentThread],i);
        }
    });
}
- (IBAction)concurrent:(id)sender {
    dispatch_async(concurrentQueue, ^{
        for(int i=0;i<100;i++){
            NSLog(@"%@=====%d",[NSThread currentThread],i);
        }
    });
    dispatch_async(concurrentQueue, ^{
        for(int i=0;i<100;i++){
            NSLog(@"%@-----%d",[NSThread currentThread],i);
        }
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
