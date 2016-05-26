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

@implementation ZSPositionButton

//正常左对齐，图标在左，文本在右
- (void)configPositionTypeNomalLeft {
    
    [self setLeftView:self.imageView rightView:self.titleLabel alignType:ZSAlignTypeLeft];
}

//正常右对齐，图标在左，文本在右
- (void)configPositionTypeNomalRight {
    
    [self setLeftView:self.titleLabel rightView:self.imageView alignType:ZSAlignTypeRight];
}

//交换左对齐，文本在左，图标在右
- (void)configPositionTypeLeft {
    
    [self setLeftView:self.titleLabel rightView:self.imageView alignType:ZSAlignTypeLeft];
}

//交换右对齐，文本在左，图标在右
- (void)configPositionTypeRight {
    
    [self setLeftView:self.imageView rightView:self.titleLabel alignType:ZSAlignTypeRight];
}

//交换居中对齐，文本在左，图标在右
- (void)configPositionTypeCenter {
    
    [self setLeftView:self.titleLabel rightView:self.imageView alignType:ZSAlignTypeCenter];
}

//文本在上，图标在下(居中)
- (void)configPositionTypeTop {
    
    [self setTopView:self.titleLabel bottomView:self.imageView];
}

//文本在下，图标在上(居中)
- (void)configPositionTypeBottom {
    
    [self setTopView:self.imageView bottomView:self.titleLabel];
}

#pragma mark - 调整左右子视图位置
- (void)setLeftView:(UIView *)leftView rightView:(UIView *)rightView alignType:(ZSAlignType)alignType {
    /**
     *  注： 当为左对齐时，左边的view即为leftView
     *          当为右对齐时，右边的view即为leftView
     */
    
    //调整左边view的frame
    CGRect leftViewFrame = leftView.frame;
    switch (alignType) {
        case ZSAlignTypeCenter: {
            CGFloat width = leftView.bounds.size.width + rightView.bounds.size.width;
            leftViewFrame.origin.x = (buttonWidth - width) / 2.0;
        }
            break;
        case ZSAlignTypeLeft:
            leftViewFrame.origin.x = 0;
            break;
            
        case ZSAlignTypeRight:
            leftViewFrame.origin.x = buttonWidth - leftView.bounds.size.width;
            break;
        default:
            break;
    }
    leftView.frame = leftViewFrame;
    
    //调整右边view的Frame
    CGRect rightViewFrame = rightView.frame;
    switch (alignType) {
        case ZSAlignTypeCenter:
            rightViewFrame.origin.x = CGRectGetMaxX(leftViewFrame);
            break;
        case ZSAlignTypeLeft:
            rightViewFrame.origin.x = CGRectGetWidth(leftViewFrame);
            break;
            
        case ZSAlignTypeRight:
            rightViewFrame.origin.x = leftViewFrame.origin.x - rightView.bounds.size.width;
            break;
        default:
            break;
    }
    rightView.frame = rightViewFrame;
}

#pragma mark - 调整上下子视图位置
- (void)setTopView:(UIView *)topView bottomView:(UIView *)bottomView {
    CGFloat height = topView.bounds.size.height  + bottomView.bounds.size.height;
    CGFloat originX = (buttonWidth - topView.bounds.size.width) / 2.0;
    CGFloat originY = (buttonHeight - height) / 2.0;
    
    CGRect topViewFrame = topView.frame;
    topViewFrame.origin.x = originX;
    topViewFrame.origin.y = originY;
    topView.frame = topViewFrame;
    
    originX = (buttonWidth - bottomView.bounds.size.width) / 2.0;
    originY = CGRectGetMaxY(topViewFrame);
    CGRect bottomViewFrame = bottomView.frame;
    bottomViewFrame.origin.x = originX;
    bottomViewFrame.origin.y = originY;
    bottomView.frame = bottomViewFrame;
}

#pragma mark - 布局子视图
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

#pragma mark - setter
- (void)setPositionType:(ZSPositionType)positionType {
    _positionType = positionType;
}

#pragma mark -  sizeToFit
- (void)sizeToFit {
    [super sizeToFit];
    
    [self layoutIfNeeded];//先让其获取尺寸再调整内容，不调用此方法，下面调整会有问题
    
    if (_positionType == ZSPositionTypeTop || _positionType == ZSPositionTypeBottom)  {
        
        CGSize titleSize = self.titleLabel.bounds.size;
        CGSize imageSize = self.imageView.bounds.size;
        
        CGFloat height = titleSize.height + imageSize.height;
        CGFloat width = MAX(titleSize.width , imageSize.width);
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
