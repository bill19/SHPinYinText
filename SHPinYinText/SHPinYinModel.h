//
//  SHPinYinModel.h
//  SHPinYinText
//
//  Created by HaoSun on 2018/5/10.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SHPinYinModel : NSObject
/**
 中文字符
 */
@property (nonatomic, copy) NSString *chineseString;
/**
 中文对应的拼音
 */
@property (nonatomic, copy) NSString *pinyinString;
/**
 下标
 */
@property (nonatomic, copy) NSString *index;
/**
 文字颜色
 */
@property (nonatomic, strong) UIColor *textColor;
@end
