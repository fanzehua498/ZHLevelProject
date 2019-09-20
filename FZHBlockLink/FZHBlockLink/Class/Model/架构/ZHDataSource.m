//
//  ZHDataSource.m
//  FZHBlockLink
//
//  Created by Mac on 2019/9/20.
//  Copyright © 2019 FZH. All rights reserved.
//

#import "ZHDataSource.h"



@interface ZHDataSource ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, copy) NSString *identif;

@property (nonatomic, strong) UITableViewCell *cell;

@property (nonatomic, copy) cellBlock bBlock;

@end

@implementation ZHDataSource

-(instancetype)initWithIdentifier:(NSString *)identifierId configureBlock:(nonnull cellBlock)block
{
    if (self = [super init]) {
        if (block) {
            self.bBlock = block;
        }
        self.identif = identifierId;
    }
    return self;
}

- (void)addDataArray:(NSMutableArray *)dataArr
{
    NSLog(@"come here");
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:dataArr];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 10;
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identif];
    id model = self.dataSource[indexPath.row];
    if (self.bBlock) {
        self.bBlock(cell, model, indexPath);
    }
    return cell;
}



-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
@end
