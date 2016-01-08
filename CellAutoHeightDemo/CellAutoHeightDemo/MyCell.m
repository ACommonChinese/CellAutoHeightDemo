//
//  MyCell.m
//  Test_1
//
//  Created by 刘威振 on 16/1/8.
//  Copyright © 2016年 fanfan. All rights reserved.
//

#import "MyCell.h"
#import "UIImageView+WebCache.h"
#import "MyImageView.h"

@interface MyCell ()

@property (weak, nonatomic) IBOutlet  MyImageView *showImageView;
@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@end

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(Model *)model {
    if (model != _model) {
        _model = model;
        [self.showImageView sd_setImageWithURL:[NSURL URLWithString:_model.imageUrl] placeholderImage:[UIImage imageNamed:@"placeholderImage"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image) {
                // NSLog(@"%@", imageURL);
                if (self.refreshHandler) {
                    self.refreshHandler();
                }
            }
        }];
        
        self.showLabel.text = model.message;
    }
}

@end
