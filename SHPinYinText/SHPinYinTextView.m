//
//  SHPinYinTextView.m
//  SHPinYinText
//
//  Created by HaoSun on 2018/5/10.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHPinYinTextView.h"
#import "SHPinYinTextCell.h"
#import "SHPinYinModel.h"
#import "UIColor+Random.h"
#define KScreenSize UIScreen.mainScreen.bounds.size

@interface SHPinYinTextView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flow;
@property (nonatomic, strong) NSArray <SHPinYinModel *>*collDataSource;
@end

@implementation SHPinYinTextView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self layOutCollectionView];
    }
    return self;
}

- (NSArray<SHPinYinModel *> *)collDataSource {
    if (!_collDataSource) {
        _collDataSource = [NSArray array];
    }
    return _collDataSource;
}

- (void)setContentString:(NSString *)contentString {
    _contentString = contentString;
    NSMutableArray *mu  =  [NSMutableArray array];
    for (NSInteger index  =  0; index < _contentString.length; index ++) {
        SHPinYinModel *model = [[SHPinYinModel alloc] init];
        model.chineseString = [_contentString substringWithRange:NSMakeRange(index, 1)];
        model.pinyinString = [self tarnsform:model.chineseString];
        model.textColor = [UIColor randomColor];
        [mu addObject:model];
    }
    self.collDataSource  =  mu;
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collDataSource.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    SHPinYinModel* model = self.collDataSource[indexPath.item];
    CGFloat width = [self getSizeWidthWithFontSize:15 andText:model.pinyinString];
    if (width > 20) {
        return CGSizeMake(width, 60);
    }else{
        return CGSizeMake(20, 60);
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SHPinYinTextCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SHPinYinTextCell" forIndexPath:indexPath];
    cell.contentModel = [self.collDataSource objectAtIndex:indexPath.item];
    return cell;
}

- (void)layOutCollectionView{

    self.flow = [[UICollectionViewFlowLayout alloc]init];
    self.flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.flow.minimumLineSpacing = 0;
    self.flow.minimumInteritemSpacing = 0;

    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenSize.width, KScreenSize.height) collectionViewLayout:self.flow];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[SHPinYinTextCell class] forCellWithReuseIdentifier:@"SHPinYinTextCell"];
    [self addSubview:self.collectionView];

}

- (NSString *)tarnsform:(NSString *)chinese{
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    return pinyin;
}

- (CGFloat)getSizeWidthWithFontSize:(CGFloat)size andText:(NSString *)text {
    UIFont *fnt = [UIFont systemFontOfSize:size];
    //根据字体得到nsstring所在的尺寸
    CGSize strSize = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil]];
    //内容的宽度
    CGFloat contentW = strSize.width;
    return contentW;
}

@end
