//
//  ZHDataSource.h
//  FZHBlockLink
//
//  Created by Mac on 2019/9/20.
//  Copyright © 2019 FZH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHMVPModel.h"

typedef void(^cellBlock)(id _Nonnull Idcell, id _Nonnull model, NSIndexPath * _Nonnull indexPath);

NS_ASSUME_NONNULL_BEGIN

@interface ZHDataSource : NSObject<UITableViewDataSource>



- (instancetype)initWithIdentifier:(NSString *)identifierId configureBlock:(cellBlock )block;

- (void)addDataArray:(NSMutableArray *)dataArr;
@end

NS_ASSUME_NONNULL_END
