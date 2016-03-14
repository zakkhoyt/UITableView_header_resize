//
//  HeaderView.m
//  HeaderControl
//
//  Created by Zakk Hoyt on 3/14/16.
//  Copyright © 2016 Zakk Hoyt. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textLabel.text = @"";
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [_delegate headerView:self didChangeFrame:self.frame];
}

- (IBAction)shrinkButtonTouchUpInside:(id)sender {
    CGRect frame = self.frame;
    frame.size.height -= 20;
    self.frame = frame;
}

- (IBAction)growButtonTouchUpInside:(id)sender {
    CGRect frame = self.frame;
    frame.size.height += 20;
    self.frame = frame;
}

@end
