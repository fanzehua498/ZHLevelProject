//
//  ZHMVP1TableViewCell.h
//  FZHBlockLink
//
//  Created by Mac on 2019/9/19.
//  Copyright © 2019 FZH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHPresent.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZHMVP1TableViewCell : UITableViewCell
@property (nonatomic, strong)  IBOutlet UIButton *subBtn;
@property (strong, nonatomic) IBOutlet UIButton *addBtn;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *numLabel;
@property (nonatomic, strong)  NSIndexPath *indexPath;
@property (nonatomic,assign)  NSInteger num;

@property (nonatomic, weak) id<ZHPresentDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
