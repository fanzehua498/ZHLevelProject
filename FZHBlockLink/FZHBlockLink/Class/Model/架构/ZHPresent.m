//
//  ZHPresent.m
//  FZHBlockLink
//
//  Created by Mac on 2019/9/19.
//  Copyright © 2019 FZH. All rights reserved.
//

#import "ZHPresent.h"

@implementation ZHPresent
-(instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *temArray = [NSArray arrayWithObjects:@{@"name":@"bLinb",@"imageUrl":@"http://blinb",@"num":@"4"},
                             @{@"name":@"aLina",@"imageUrl":@"http://alina",@"num":@"49"},
                             @{@"name":@"cLinc",@"imageUrl":@"http://clinc",@"num":@"9"},
                             @{@"name":@"dLind",@"imageUrl":@"http://dlind",@"num":@"5"},
                             @{@"name":@"kLink",@"imageUrl":@"http://klink",@"num":@"19"},nil];
        for (int i = 0; i < temArray.count; i ++) {
            ZHMVPModel *model = [ZHMVPModel yy_modelWithDictionary:temArray[i]];
            [self.dataSource addObject:model];
        }
    }
    return self;
}

#pragma mark
-(void)didClickNumBtn:(NSString *)num indexPath:(NSIndexPath *)indexPath
{
    @synchronized (self) {
        if (indexPath.row < self.dataSource.count) {
            ZHMVPModel *model = self.dataSource[indexPath.row];
            model.num = num;
            NSLog(@"%@",model.num);
        }
        if (num.integerValue > 5) {
            [self.dataSource removeAllObjects];
            NSArray *temArray = [NSArray arrayWithObjects:@{@"name":@"new1",@"imageUrl":@"http://blinb",@"num":@"4"},
                                 @{@"name":@"new2",@"imageUrl":@"http://alina",@"num":@"49"},nil];
            for (int i = 0; i < temArray.count; i ++) {
                ZHMVPModel *model = [ZHMVPModel yy_modelWithDictionary:temArray[i]];
                [self.dataSource addObject:model];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(reloadUI)]) {
                [self.delegate reloadUI];
            }
        }
    }
}

#pragma mark - lazy
-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataSource;
}

@end
