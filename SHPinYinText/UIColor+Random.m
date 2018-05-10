//
//  UIColor+Random.m
//  SHPinYinText
//
//  Created by HaoSun on 2018/5/10.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)
+ (UIColor *)randomColor {
    return [UIColor colorWithRed:((arc4random() % 255) / 255.0) green:((arc4random() % 255) / 255.0) blue:((arc4random() % 255) / 255.0) alpha:1.0f];
}
@end
