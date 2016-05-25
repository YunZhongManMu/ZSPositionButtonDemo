//
//  ZSPositionButton.m
//  ZSPositionButtonDemo
//
//  Created by 周顺 on 16/4/26.
//  Copyright © 2016年 AIRWALK. All rights reserved.
//

#import "ZSPositionButton.h"

#define buttonWidth         self.bounds.size.width
#define buttonHeight        self.bounds.size.height
#define imageWidth          self.imageView.bounds.size.width
#define imageHeight         self.imageView.bounds.size.height
#define titleWidth               self.titleLabel.bounds.size.width
#define titleHeight              self.titleLabel.bounds.size.height

#define imageViewFrame           self.imageView.frame
#define titleLabelFrame               self.titleLabel.frame

@implementation ZSPositionButton

//正常左对齐，图标在左，文本在右
- (void)configPositionTypeNomalLeft {
    CGRect imageFrame = imageViewFrame;
    imageFrame.origin.x = 0;
    imageViewFrame = imageFrame;
    
    CGRect titleFrame = titleLabelFrame;
    titleFrame.origin.x = CGRectGetWidth(imageFrame);
    titleLabelFrame = titleFrame;
}

//正常右对齐，图标在左，文本在右
- (void)configPositionTypeNomalRight {
    CGRect titleFrame = titleLabelFrame;
    titleFrame.origin.x = buttonWidth - titleWidth;
    titleLabelFrame = titleFrame;
    
    CGRect imageFrame = imageViewFrame;
    imageFrame.origin.x = titleFrame.origin.x - imageWidth;
    imageViewFrame = imageFrame;
}

//交换左对齐，文本在左，图标在右
- (void)configPositionTypeLeft {
    CGRect titleFrame = titleLabelFrame;
    titleFrame.origin.x = 0;
    titleLabelFrame = titleFrame;
    
    CGRect imageFrame = imageViewFrame;
    imageFrame.origin.x = CGRectGetWidth(titleFrame);
    imageViewFrame = imageFrame;
}

//交换右对齐，文本在左，图标在右
- (void)configPositionTypeRight {
    CGRect imageFrame = imageViewFrame;
    imageFrame.origin.x = buttonWidth - imageWidth;
    imageViewFrame = imageFrame;
    
    CGRect titleFrame = titleLabelFrame;
    titleFrame.origin.x = imageFrame.origin.x - titleWidth ;
    titleLabelFrame = titleFrame;
}

//交换居中对齐，文本在左，图标在右
- (void)configPositionTypeCenter {
    CGFloat width = titleWidth + imageWidth;
    
    CGRect titleFrame = titleLabelFrame;
    titleFrame.origin.x = (buttonWidth - width) / 2.0;
    titleLabelFrame = titleFrame;
    
    CGRect imageFrame = imageViewFrame;
    imageFrame.origin.x = CGRectGetMaxX(titleFrame);
    imageViewFrame = imageFrame;
}

//文本在上，图标在下(居中)
- (void)configPositionTypeTop {
    CGFloat height = imageHeight  + titleHeight;
    CGFloat originX = (buttonWidth - titleWidth) / 2.0;
    CGFloat originY = (buttonHeight - height) / 2.0;
    
    CGRect titleFrame = titleLabelFrame;
    titleFrame.origin.x = originX;
    titleFrame.origin.y = originY;
    titleLabelFrame = titleFrame;
    
    originX = (buttonWidth - imageWidth) / 2.0;
    originY = CGRectGetMaxY(titleFrame);
    CGRect imageFrame = imageViewFrame;
    imageFrame.origin.x = originX;
    imageFrame.origin.y = originY;
    imageViewFrame = imageFrame;
}

//文本在下，图标在上(居中)
- (void)configPositionTypeBottom {
    CGFloat height = imageHeight  + titleHeight;
    CGFloat originX = (buttonWidth - imageWidth) / 2.0;
    CGFloat originY = (buttonHeight - height) / 2.0;
    
    CGRect imageFrame = imageViewFrame;
    imageFrame.origin.x = originX;
    imageFrame.origin.y = originY;
    imageViewFrame = imageFrame;
    
    originX = (buttonWidth - titleWidth) / 2.0;
    originY = CGRectGetMaxY(imageFrame);
    CGRect titleFrame = titleLabelFrame;
    titleFrame.origin.x = originX;
    titleFrame.origin.y = originY;
    titleLabelFrame = titleFrame;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    switch (self.positionType) {
        case ZSPositionTypeNomal:
            //默认状态下不处理
            break;
            
        case ZSPositionTypeNomalLeft:
            [self configPositionTypeNomalLeft];
            break;
            
        case ZSPositionTypeNomalRight:
            [self configPositionTypeNomalRight];
            break;
            
        case ZSPositionTypeLeft:
            [self configPositionTypeLeft];
            break;
            
        case ZSPositionTypeRight:
            [self configPositionTypeRight];
            break;
            
        case ZSPositionTypeCenter:
            [self configPositionTypeCenter];
            break;
            
        case ZSPositionTypeTop:
            [self configPositionTypeTop];
            break;
            
        case ZSPositionTypeBottom:
            [self configPositionTypeBottom];
            break;
            
        default:
            break;
    }
}


- (void)setPositionType:(ZSPositionType)positionType {
    _positionType = positionType;
}

- (void)sizeToFit {
    [super sizeToFit];
    
    [self layoutIfNeeded];//先让其获取尺寸再调整内容，不调此方法，下面调整会有问题
    
    if (_positionType == ZSPositionTypeTop || _positionType == ZSPositionTypeBottom)  {
        CGFloat height = titleHeight + imageHeight;
        CGFloat width = MAX(titleWidth,imageWidth);
        CGFloat padding = fabs(buttonWidth - width);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -padding);//调整内边距，不调整，文本显示会有问题
        
        CGRect frame = self.frame;
        frame.size.height = height;
        frame.size.width = width + 5;
        self.frame = frame;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
