//
//  ZHCellchangeViewController.m
//  FZHBlockLink
//
//  Created by Mac on 2019/8/1.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import "ZHCellchangeViewController.h"
#import "ZHTransformViewController.h"
#import "ZHMetal2ViewController.h"
@interface ZHCellchangeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UITableView *table;

@end

@implementation ZHCellchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.table];
    
}




#pragma mark - UITableViewDelegate UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellId"];
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld个",indexPath.row];
    cell.textLabel.text = self.dataSource[indexPath.row];
//    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSIndexPath *bottom = [NSIndexPath indexPathForRow:1 inSection:0];
//    NSIndexPath *top = [NSIndexPath indexPathForRow:0 inSection:0];
////    [self.dataSource insertObject:@"ad" atIndex:0];
////    [tableView insertRowsAtIndexPaths:@[top] withRowAnimation:UITableViewRowAnimationBottom];
//    [self.dataSource removeObjectAtIndex:1];
//    [tableView deleteRowsAtIndexPaths:@[bottom] withRowAnimation:UITableViewRowAnimationTop];
    
//    [self.table reloadData];
//    [[NSBundle mainBundle] loadNibNamed:@"ZHTransformViewController" owner:nil options:nil].lastObject;
//    NSURL *url = [NSURL URLWithString:@"itms-services://?action=download-manifest&url=https://gitee.com/fanzehua498/DownloadForIpa/raw/master/ios/app/manifest.plist"];
//    [[UIApplication sharedApplication] openURL:url];
//    ZHMetal2ViewController *vc = [[ZHMetal2ViewController alloc] initWithNibName:@"ZHMetal2ViewController" bundle:[NSBundle mainBundle]];
//    ZHTransformViewController *vc = [[ZHTransformViewController alloc] initWithNibName:@"ZHTransformViewController" bundle:[NSBundle mainBundle]];
//    [self.navigationController pushViewController:vc animated:YES];
    [DCURLRouter pushURLString:@"ZHLink://Metal2VC" query:@{} animated:YES replace:NO];
    return;
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
//    UITableViewCell *nextCell = [tableView cellForRowAtIndexPath:nextIndexPath];
    CGFloat cellY = cell.frame.origin.y;
    [UIView animateWithDuration:0.6 animations:^{
        //当前这个顶部就和上面一个平齐
        CGRect rect = cell.frame;
//        rect.origin.y = cellY + CGRectGetHeight(nextCell.frame);
        rect.origin.y = 0;
        cell.frame = rect;
        
        for (NSInteger i = 0; i < indexPath.row; i ++) {
            NSIndexPath *sortIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
            UITableViewCell *sortcell = [tableView cellForRowAtIndexPath:sortIndexPath];
            CGRect sortrect = sortcell.frame;
            sortrect.origin.y = sortcell.frame.size.height + CGRectGetHeight(sortcell.frame);
            sortcell.frame = sortrect;
        }
        //上面一个需要处理一下,只能基于当前的y+下面的cell的高度,直接交换y轴,位置不准,在刷新表格的时候,会有抖动的现象
//        CGRect rect1 = nextCell.frame;
//        rect1.origin.y = cellY;
//        nextCell.frame = rect1;
    }completion:^(BOOL finished)
    {
        id obj = self.dataSource[indexPath.row];
        [self.dataSource insertObject:obj atIndex:0];
        [self.dataSource removeObjectAtIndex:indexPath.row + 1];
        
//        [self.dataSource exchangeObjectAtIndex:indexPath.row withObjectAtIndex:nextIndexPath.row];
//        [heightArray exchangeObjectAtIndex:indexPath.row withObjectAtIndex:nextIndexPath.row];
        [self.table reloadData];
    }];
    
    
}


#pragma mark - lazy
-(UITableView *)table
{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}


-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil];
    }
    return _dataSource;
}

@end
