//
//  MyImageView.m
//  Test_1
//
//  Created by 刘威振 on 16/1/8.
//  Copyright © 2016年 fanfan. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView


- (CGSize)intrinsicContentSize {
    // NSLog(@"%lf", self.bounds.size.width);
    CGFloat width = [[UIScreen mainScreen] bounds].size.width - 16;
    return CGSizeMake(width, width*self.image.size.height/self.image.size.width);
}

@end
