//
//  MyCell.h
//  Test_1
//
//  Created by 刘威振 on 16/1/8.
//  Copyright © 2016年 fanfan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface MyCell : UITableViewCell

@property (nonatomic) Model *model;
@property (nonatomic) NSIndexPath *indexPath;

@property (nonatomic, copy) void (^refreshHandler)();

@end
