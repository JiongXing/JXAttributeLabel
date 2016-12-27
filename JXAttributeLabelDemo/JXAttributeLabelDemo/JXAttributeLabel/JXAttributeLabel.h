//
//  JXAttributeLabel.h
//  JXAttributeLabelDemo
//
//  Created by JiongXing on 2016/12/26.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXAttributeLabel : UILabel

/// 设置属性，section为段号
- (void)setAttributes:(NSDictionary *)attributes atSection:(NSInteger)section;

/// 设置字符串，section为段号
- (void)setString:(NSString *)string atSection:(NSInteger)section;

@end
