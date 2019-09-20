//
//  ZHPresent.h
//  FZHBlockLink
//
//  Created by Mac on 2019/9/19.
//  Copyright © 2019 FZH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHMVPModel.h"
@protocol ZHPresentDelegate <NSObject>

@optional
- (void)didClickNumBtn:(NSString *)num indexPath:(NSIndexPath *)indexPath;


@end


@protocol reloadDelegate <NSObject>

@optional
- (void)reloadUI;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ZHPresent : NSObject<ZHPresentDelegate>

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, weak) id<reloadDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
