//
//  ZHMVP1TableViewCell.m
//  FZHBlockLink
//
//  Created by Mac on 2019/9/19.
//  Copyright © 2019 FZH. All rights reserved.
//

#import "ZHMVP1TableViewCell.h"

@implementation ZHMVP1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}
- (IBAction)didClickSubBtn:(UIButton *)sender {
    
    if ([self.numLabel.text integerValue] <= 0) {
        return;
    }
    NSInteger index = [self.numLabel.text integerValue];
    self.num = index - 1;
//    self.num --;
}
- (IBAction)didClickAddBtn:(UIButton *)sender {
    if ([self.numLabel.text integerValue] >= 200) {
        return;
    }
    NSInteger index = [self.numLabel.text integerValue];
    self.num = index + 1;
//    self.num ++;
}

-(void)setNum:(NSInteger)num
{
    _num = num;
    NSLog(@"%s",__func__);
    self.numLabel.text = [NSString stringWithFormat:@"%ld",(long)num];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickNumBtn:indexPath:)]) {
        [self.delegate didClickNumBtn:self.numLabel.text indexPath:self.indexPath];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
