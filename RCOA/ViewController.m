//
//  ViewController.m
//  RCOA
//
//  Created by dengdongyang on 17/3/20.
//  Copyright © 2017年 dengdongyang. All rights reserved.
//

#import "ViewController.h"
#import "MyTestChatViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "ChatController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(50, 200, 200, 30);
    [btn1 setTitle:@"聚合单聊展示" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(private:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(50, 240, 200, 30);
    [btn2 setTitle:@"讨论组" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];    [btn2 addTarget:self action:@selector(discuss:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];

   
}
-(void)private:(UIButton *)sender{
    
    MyTestChatViewController *chatVc = [[MyTestChatViewController alloc]init];
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [chatVc setCollectionConversationType:@[@(ConversationType_PRIVATE)]];
    [self.navigationController pushViewController:chatVc animated:YES];
}
-(void)discuss:(UIButton *)sender{
    NSArray *array = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    __weak ViewController *weakSelf =self;
    [[RCIMClient sharedRCIMClient] createDiscussion:@"3个火枪手" userIdList:array success:^(RCDiscussion *discussion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            ChatController *chat =
            [[ChatController alloc] init];
            chat.targetId = discussion.discussionId;
            chat.conversationType = ConversationType_DISCUSSION;
            chat.title = discussion.discussionName;
            [weakSelf.navigationController pushViewController:chat animated:YES];
        });
       
    } error:^(RCErrorCode status) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
