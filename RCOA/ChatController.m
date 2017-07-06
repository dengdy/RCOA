//
//  ChatController.m
//  RCOA
//
//  Created by 邓东阳 on 2017/7/6.
//  Copyright © 2017年 dengdongyang. All rights reserved.
//

#import "ChatController.h"

@interface ChatController ()

@end

@implementation ChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置背景颜色
    self.conversationMessageCollectionView.backgroundColor =[UIColor yellowColor];
    //设置背景图片
//    self.conversationMessageCollectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"af882ac3f3e2de63230f8b9f4b928e59.jpeg"]];
}


@end
