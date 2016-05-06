//
//  ExampleFour.m
//  UICollectionView
//
//  Created by 侯英格 on 16/5/6.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "ExampleFour.h"
#import "ExampleFourCell.h"
#import "ExampleFourLayout.h"
static NSString*headerReuseIdentifier=@"ExampleFourHeader";
static NSString*FooterReuseIdentifier=@"ExampleFourFooter";
static NSString*cellReuseIdentifier=@"ExampleFourCell";

@interface ExampleFour ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray*collectionDataArray;
@end

@implementation ExampleFour


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=NSStringFromClass(self.class);
    self.collectionView.backgroundColor=[UIColor blackColor];
    
    //用了代理 就不需要指定属性了 普通的layout 就是适用那种最简单的布局
//    UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc] init];
//    layout.minimumLineSpacing=5;
//    layout.minimumInteritemSpacing=5;
//    layout.itemSize=CGSizeMake(100, 100);
//    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
//    layout.headerReferenceSize=CGSizeMake(150, 150);
//    layout.footerReferenceSize=CGSizeMake(150, 150);
//    layout.sectionInset=UIEdgeInsetsMake(3, 3, 3, 3);
//    layout.sectionHeadersPinToVisibleBounds=NO;
//    layout.sectionFootersPinToVisibleBounds=NO;

    [self.collectionView setCollectionViewLayout:[[ExampleFourLayout alloc] init] animated:YES];
    
    self.collectionDataArray=[NSMutableArray array];
    for (int i=0; i<60; i++) {
        [self.collectionDataArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collectionDataArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ExampleFourCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor=[UIColor yellowColor];
    cell.contentView.layer.cornerRadius = 35.0;
    cell.contentView.layer.borderWidth = 1.0f;
    cell.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    cell.contentView.layer.borderColor = [UIColor redColor].CGColor;
    return cell;
}

//可复用的header footer view
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    UICollectionReusableView*view;
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        view=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerReuseIdentifier forIndexPath:indexPath];
//        view.backgroundColor=[UIColor redColor];
//    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
//        view=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterReuseIdentifier forIndexPath:indexPath];
//        view.backgroundColor=[UIColor blueColor];
//    }
//    return view;
//}

@end
