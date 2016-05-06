//
//  ViewController.m
//  UICollectionView
//
//  Created by 侯英格 on 16/5/6.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "ViewController.h"
#import "ExampleOne.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray*dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"UICollectionView";
}

#pragma mark -----------tableView-delegate-----------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=[self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController*controller;
    UIStoryboard* storyBoard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    switch (indexPath.row) {
        case 0:
        {
            controller=[[ExampleOne alloc] init];
        }
            break;
        case 1:
        {
            controller = [storyBoard instantiateViewControllerWithIdentifier:@"ExampleTwo"];
        }
            break;
        case 2:
        {
            controller = [storyBoard instantiateViewControllerWithIdentifier:@"ExampleThree"];
        }
            break;
        case 3:
        {
            controller = [storyBoard instantiateViewControllerWithIdentifier:@"ExampleFour"];
        }
            break;
        case 4:
        {
            
        }
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:controller animated:YES];
}

-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray=[NSArray arrayWithObjects:@"手写版本-最普通的UICollectionLayout",@"xib版本-最普通的UICollectionLayout", @"没有UICollectionLayout 把layout的属性替换成代理", @"自定义layout 1", @"自定义layout 2", @"自定义layout 3", nil];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
