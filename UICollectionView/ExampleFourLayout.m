//
//  ExampleFourLayout.m
//  UICollectionView
//
//  Created by 侯英格 on 16/5/6.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "ExampleFourLayout.h"

@interface ExampleFourLayout()
@end

#define ITEM_SIZE 200.0
#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.3

@implementation ExampleFourLayout

-(void)prepareLayout{
    [super prepareLayout];
    self.itemSize = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.sectionInset = UIEdgeInsetsMake(200, 0.0, 200, 0.0);//上下边距
    self.minimumLineSpacing = 50.0;//行间距
    CGSize size=[self collectionViewContentSize];
    NSLog(@"%@",NSStringFromCGSize(size));
}

//当布局发生改变的时候 是否应该刷新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    //rect 代表的是滚动过的frame总共加起来
    NSLog(@"rect---%@",NSStringFromCGRect(rect));
    
    //取父类的UICollectionViewLayoutAttributes
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    
    //当前可以看到的collectionView 的可视frame
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    NSLog(@"visibleRect---%@",NSStringFromCGRect(visibleRect));
    
    //设置item的缩放
    for (UICollectionViewLayoutAttributes* attributes in array) {
        //如果当前可视的frame 和已经滚动过的frame 有重合的地方 也就是说某一个cell要滚动进入屏幕的时候
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            
            //CGRectGetMidX(visibleRect) 可是屏幕的中心点
            //attributes.center.x 某一个cell 的中心点
            //也就是说某一个cell的中心点 到屏幕中心点的距离
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;//item到中心点的距离
            
            //比例=距离/固定量
            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;//距离除以有效距离得到标准化距离
            
            
            //距离小于有效距离才生效
            //ABS()绝对值
            //固定量
            
            //如果我的距离小于有效距离
            if (ABS(distance) < ACTIVE_DISTANCE) {
                CGFloat zoom = 1 + ZOOM_FACTOR*(1 - ABS(normalizedDistance));//缩放率范围1~1.3,与标准距离负相关
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);//x,y轴方向变换
                attributes.zIndex = 1;
            }
        }
    }
    return array;
}

//对齐到网格 返回一个
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //proposedContentOffset是没有对齐到网格时本来应该停下的位置
    
    //计算出实际中心位置
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    
    //取当前屏幕中的UICollectionViewLayoutAttributes
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
    
    //对当前屏幕中的UICollectionViewLayoutAttributes逐个与屏幕中心进行比较，找出最接近中心的一个
    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    
    //返回调整好的point
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}

@end
