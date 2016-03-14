//
//  HeaderView.h
//  HeaderControl
//
//  Created by Zakk Hoyt on 3/14/16.
//  Copyright © 2016 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeaderView;

@protocol HeaderViewDelegate<NSObject>
@optional
- (void)headerView:(HeaderView *)headerView didChangeFrame:(CGRect)frame;
@end

@interface HeaderView : UIView
@property(nonatomic, weak) id<HeaderViewDelegate> delegate;
@property(weak, nonatomic) IBOutlet UIView *contentView;
@property(weak, nonatomic) IBOutlet UILabel *textLabel;
@end
