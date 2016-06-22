//
//  SegmentControl.m
//  SegmentControl
//
//  Created by WengRenPu on 16/5/25.
//  Copyright © 2016年 WengRenPu. All rights reserved.
//

#import "SegmentControl.h"

@implementation SegmentControl {
    CGFloat witdthFloat;
    UIView * buttonDownView;
    NSInteger selectSeugment;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.btnNumbers = [NSMutableArray array];
        selectSeugment = 0;// 默认选中
    }
    return self;
}


+ (SegmentControl*)segmentControlFrame:(CGRect)frame btnNumbers:(NSArray *)btnNumbers backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont selectedColor:(UIColor *)selectedColor buttonDownColor:(UIColor *)buttonDownColor delegate:(id)delegate {
    
    SegmentControl * smc = [[self alloc] initWithFrame:frame];
    smc.backgroundColor = backgroundColor;
    smc.buttonDownColor = buttonDownColor;
    
    smc.titleColor = titleColor;
    smc.titleFont = titleFont;
    smc.selectedColor = selectedColor;
    smc.delegate = delegate;
    [smc AddSegumentArray:btnNumbers];
    
    return smc;
}

- (void)AddSegumentArray:(NSArray *)SegumentArray{
    
    // 1.按钮的个数
    NSInteger seugemtNumber = SegumentArray.count;
    
    // 2.按钮的宽度
    witdthFloat = (self.bounds.size.width) / seugemtNumber;
    
    // 3.创建按钮
    for (int i = 0; i < SegumentArray.count; i++) {
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(i * witdthFloat, 0, witdthFloat, self.bounds.size.height - 2)];
        [btn setTitle:SegumentArray[i] forState:UIControlStateNormal];
        [btn.titleLabel setFont:self.titleFont];
        [btn setTitleColor:self.titleColor forState:UIControlStateNormal];
        [btn setTitleColor:self.selectedColor forState:UIControlStateSelected];
        btn.tag = i + 1;
        
        [btn addTarget:self action:@selector(changeSegumentAction:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            buttonDownView =[[UIView alloc]initWithFrame:CGRectMake(i * witdthFloat, self.bounds.size.height - 2, witdthFloat, 2)];
            [buttonDownView setBackgroundColor:self.buttonDownColor];
            
            [self addSubview:buttonDownView];
        }
        [self addSubview:btn];
        
        [self.btnNumbers addObject:btn];
    }
    [[self.btnNumbers firstObject] setSelected:YES];
}

- (void)changeSegumentAction:(UIButton *)btn {
    [self selectTheSegument:btn.tag - 1];
}

-(void)selectTheSegument:(NSInteger)segumentNumbers {
    
    if (selectSeugment != segumentNumbers) {
        
        [self.btnNumbers[selectSeugment] setSelected:NO];
        [self.btnNumbers[segumentNumbers] setSelected:YES];
        
        [UIView animateWithDuration:0.2 animations:^{
            
            [buttonDownView setFrame:CGRectMake(segumentNumbers * witdthFloat,self.bounds.size.height - 2, witdthFloat, 2)];
        }];
        selectSeugment = segumentNumbers;
        [self.delegate segumentIndexChange:selectSeugment];
    }
}


@end
