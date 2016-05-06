//
//  ExampleTwo.m
//  UICollectionView
//
//  Created by 侯英格 on 16/5/6.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "ExampleTwo.h"
#import "ExampleTwoCell.h"

static NSString*headerReuseIdentifier=@"ExampleTwoHeader";
static NSString*FooterReuseIdentifier=@"ExampleTwoFooter";
static NSString*cellReuseIdentifier=@"ExampleTwoCell";

@interface ExampleTwo ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray*collectionDataArray;
@end

@implementation ExampleTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=NSStringFromClass(self.class);
    
    
    UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing=5;
    layout.minimumInteritemSpacing=5;
    layout.itemSize=CGSizeMake(100, 100);
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    layout.headerReferenceSize=CGSizeMake(150, 150);
    layout.footerReferenceSize=CGSizeMake(150, 150);
    layout.sectionInset=UIEdgeInsetsMake(3, 3, 3, 3);
    layout.sectionHeadersPinToVisibleBounds=NO;
    layout.sectionFootersPinToVisibleBounds=NO;
    
    self.collectionView.collectionViewLayout=layout;
    
    self.collectionDataArray=[NSMutableArray array];
    for (int i=0; i<20; i++) {
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
    ExampleTwoCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"ExampleTwoCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor=[UIColor yellowColor];
    return cell;
}

//可复用的header footer view
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView*view;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerReuseIdentifier forIndexPath:indexPath];
        view.backgroundColor=[UIColor redColor];
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        view=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterReuseIdentifier forIndexPath:indexPath];
        view.backgroundColor=[UIColor blueColor];
    }
    return view;
}




@end
