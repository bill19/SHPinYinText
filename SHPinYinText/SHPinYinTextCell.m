//
//  SHPinYinTextCell.m
//  SHPinYinText
//
//  Created by HaoSun on 2018/5/10.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHPinYinTextCell.h"

@interface SHPinYinTextCell ()

@property (strong , nonatomic)UILabel *pinyingLabel;

@property (strong , nonatomic)UILabel *chineseLabel;

@end
@implementation SHPinYinTextCell
- (UILabel *)pinyingLabel{
    if (!_pinyingLabel) {
        _pinyingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 30.0f)];
        _pinyingLabel.font = [UIFont systemFontOfSize:13];
        _pinyingLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_pinyingLabel];
    }
    return _pinyingLabel;
}

- (UILabel *)chineseLabel {
    if (!_chineseLabel) {
        _chineseLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pinyingLabel.frame), self.bounds.size.width, 30.0f)];
        _chineseLabel.font = [UIFont systemFontOfSize:13];
        _chineseLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_chineseLabel];
    }
    return _chineseLabel;
}
- (void)setContentModel:(SHPinYinModel *)contentModel {
    _contentModel = contentModel;
    self.pinyingLabel.text = _contentModel.pinyinString;
    self.pinyingLabel.textColor = _contentModel.textColor;
    self.chineseLabel.text = _contentModel.chineseString;
    self.chineseLabel.textColor = _contentModel.textColor;
}
@end
