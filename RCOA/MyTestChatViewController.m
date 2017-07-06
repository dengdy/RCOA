//
//  MyTestChatViewController.m
//  RCOA
//
//  Created by dengdongyang on 17/3/21.
//  Copyright © 2017年 dengdongyang. All rights reserved.
//

#import "MyTestChatViewController.h"
#import "ChatController.h"
@interface MyTestChatViewController ()
@end

@implementation MyTestChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE)]];
//    self.cellBackgroundColor = [UIColor orangeColor];
    //设置cell的背景颜色
//    self.cellBackgroundColor = [UIColor cyanColor];
    
    //设置置顶的cell的背景颜色(这个目前测试无效)
    self.topCellBackgroundColor = [UIColor yellowColor];
}
//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_COLLECTION) {
        MyTestChatViewController *textVC = [[MyTestChatViewController alloc]init];
        textVC.isEnteredToCollectionViewController = YES;
        NSArray *array = [NSArray arrayWithObject:[NSNumber numberWithInt:model.conversationModelType]];
        [textVC setDisplayConversationTypeArray:array];
        [textVC setCollectionConversationType:nil];
        [self.navigationController pushViewController:textVC animated:YES];
    }else if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_NORMAL){
    ChatController *conversationVC = [[ChatController alloc]init];
    conversationVC.conversationType = model.conversationType;
        //设置是否显示昵称
    conversationVC.displayUserNameInCell = NO;
    conversationVC.targetId = model.targetId;
    conversationVC.title = model.conversationTitle;
    [self.navigationController pushViewController:conversationVC animated:YES];
    }
   
}

- (void)willDisplayConversationTableCell:(RCConversationBaseCell *)cell
                             atIndexPath:(NSIndexPath *)indexPath{
    RCConversationCell *cell1 = (RCConversationCell *)cell;
    cell1.conversationTitle.textColor = [UIColor redColor];
    cell1.portraitStyle = RC_USER_AVATAR_CYCLE;
    RCConversationModel *model=
    self.conversationListDataSource[indexPath.row];
    if (model.conversationType == ConversationType_PRIVATE) {
        ((RCConversationCell *)cell).isShowNotificationNumber = YES;
    }

}




@end
