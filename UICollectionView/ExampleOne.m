//
//  ExampleOne.m
//  UICollectionView
//
//  Created by 侯英格 on 16/5/6.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "ExampleOne.h"
#import "defineHeader.h"
#import "ExampleOneCell.h"

static NSString*headerReuseIdentifier=@"sectionHeader";
static NSString*FooterReuseIdentifier=@"sectionFooter";

@interface ExampleOne ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView*collectionView;
@property(nonatomic,strong)NSMutableArray*collectionDataArray;
@end

@implementation ExampleOne

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
}

-(void)creatUI{
    UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing=5;
    layout.minimumInteritemSpacing=5;
    layout.itemSize=CGSizeMake(100, 100);
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    layout.headerReferenceSize=CGSizeMake(150, 150);
    layout.footerReferenceSize=CGSizeMake(150, 150);
    layout.sectionInset=UIEdgeInsetsMake(3, 3, 3, 3);
    layout.sectionHeadersPinToVisibleBounds=NO;
    layout.sectionFootersPinToVisibleBounds=NO;
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, UIW, UIH) collectionViewLayout:layout];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:self.collectionView];
    
    self.collectionDataArray=[NSMutableArray array];
    for (int i=0; i<20; i++) {
        [self.collectionDataArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    [self.collectionView registerClass:[ExampleOneCell class] forCellWithReuseIdentifier:@"ExampleOneCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerReuseIdentifier];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterReuseIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collectionDataArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ExampleOneCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"ExampleOneCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor=[UIColor greenColor];
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
