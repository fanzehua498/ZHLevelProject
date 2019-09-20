//
//  ZHJGViewController.m
//  FZHBlockLink
//
//  Created by Mac on 2019/9/19.
//  Copyright © 2019 FZH. All rights reserved.
//

#import "ZHJGViewController.h"
#import "ZHDataSource.h"
#import "ZHMVP1TableViewCell.h"
#import "ZHMVPModel.h"
#import "ZHPresent.h"

@interface ZHJGViewController ()<reloadDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZHDataSource *dataSource;

@property (nonatomic, strong) ZHPresent *pt;

@end

@implementation ZHJGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    __weak typeof(self) weakSelf = self;
    self.pt = [[ZHPresent alloc] init];
    self.dataSource = [[ZHDataSource alloc] initWithIdentifier:@"dataCell" configureBlock:^(ZHMVP1TableViewCell *  _Nonnull Idcell, ZHMVPModel*  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
        __strong typeof(weakSelf) StrongSelf = weakSelf;
        
        Idcell.numLabel.text = model.num;
        Idcell.nameLabel.text = model.name;
//        Idcell.num = model.num.integerValue;
        
        Idcell.delegate = StrongSelf.pt;
        Idcell.indexPath = indexPath;
    }];
    
    [self.dataSource addDataArray:self.pt.dataSource];
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
    
    self.pt.delegate = self;
}

#pragma mark - ReloadDelegate
-(void)reloadUI
{
    [self.dataSource addDataArray:self.pt.dataSource];
    [self.tableView reloadData];
}


#pragma mark - lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerNib:[UINib nibWithNibName:@"ZHMVP1TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"dataCell"];
    }
    return _tableView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
