//
//  ZSPositionButton.h
//  ZSPositionButtonDemo
//
//  Created by 周顺 on 16/4/26.
//  Copyright © 2016年 AIRWALK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZSPositionType) {
    ZSPositionTypeNomal = 0,          //正常，默认为图标在左，文本在右(居中)
    ZSPositionTypeNomalLeft,          //正常左对齐，图标在左，文本在右
    ZSPositionTypeNomalRight,        //正常右对齐，图标在左，文本在右
    ZSPositionTypeLeft,                      //交换左对齐，文本在左，图标在右
    ZSPositionTypeRight,                    //交换右对齐，文本在左，图标在右
    ZSPositionTypeCenter,                 //交换居中对齐，文本在左，图标在右
    ZSPositionTypeTop,                      //文本在上，图标在下(居中)
    ZSPositionTypeBottom,                //文本在下，图标在上(居中)
};

@interface ZSPositionButton : UIButton

/** 位置类型 */
@property (nonatomic, assign) ZSPositionType positionType;

@end
