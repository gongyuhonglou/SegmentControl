//
//  SegmentControl.h
//  SegmentControl
//
//  Created by WengRenPu on 16/5/25.
//  Copyright © 2016年 WengRenPu. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SegmentControlDelegate <NSObject>

@optional
- (void)segumentIndexChange:(NSInteger)index;
@end

@interface SegmentControl : UIView

@property(nonatomic,strong)id <SegmentControlDelegate>delegate;

@property (nonatomic,strong) NSMutableArray *btnNumbers;
@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) UIColor * selectedColor;
@property (nonatomic,strong) UIFont * titleFont;
@property (nonatomic,strong) UIColor * buttonDownColor;


/**
 *  创建分段控制器
 *
 *  @param frame           视图范围
 *  @param btnNumbers      按钮数量
 *  @param backgroundColor 背景颜色
 *  @param titleColor      字体颜色
 *  @param titleFont       字体大小
 *  @param selectedColor   选中颜色
 *  @param buttonDownColor 选中按钮颜色
 *  @param delegate        遵循的协议
 *
 *  @return 返回分段控制器
 */
+ (SegmentControl*)segmentControlFrame:(CGRect)frame
                           btnNumbers:(NSArray*)btnNumbers
                      backgroundColor:(UIColor*)backgroundColor
                           titleColor:(UIColor*)titleColor
                            titleFont:(UIFont*)titleFont
                        selectedColor:(UIColor*)selectedColor
                      buttonDownColor:(UIColor*)buttonDownColor
                             delegate:(id)delegate;


@end
