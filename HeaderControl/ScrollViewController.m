//
//  ScrollViewController.m
//  HeaderControl
//
//  Created by Zakk Hoyt on 4/26/16.
//  Copyright © 2016 Zakk Hoyt. All rights reserved.
//

#import "ScrollViewController.h"
#import "CollectionViewController.h"

@interface ScrollViewController ()
@property (nonatomic, strong) CollectionViewController *firstVC;
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstHeight;

@property (nonatomic, strong) CollectionViewController *secondVC;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondHeight;
@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.secondView.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SegueFirst"]) {
        _firstVC = segue.destinationViewController;
        //        [_firstVC reloadCollectionView];
    } else if ([segue.identifier isEqualToString:@"SegueSecond"]) {
        _secondVC = segue.destinationViewController;
        //        [_secondVC reloadCollectionView];
    }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id<UIContentContainer>)container {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super preferredContentSizeDidChangeForChildContentContainer:container];

    //    NSLog(@"preferredContentSize = %@", NSStringFromCGSize([container preferredContentSize]));
    //    CGSize size = [container preferredContentSize];
    //    _tableHeaderContainerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, size.height);
    //    self.tableView.tableHeaderView = _tableHeaderContainerView;
    //
    //    [UIView animateWithDuration:0.3 animations:^{
    //        [self.tableView layoutIfNeeded];
    //    }];

    _firstHeight.constant = _firstVC.collectionView.contentSize.height;
    _secondHeight.constant = _secondVC.collectionView.contentSize.height;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];

}

- (IBAction)buttonAction:(id)sender {

    if (_secondHeight.constant == _secondVC.collectionView.contentSize.height) {
        _secondHeight.constant = 0;
    } else {
        _secondHeight.constant = _secondVC.collectionView.contentSize.height;
    }

    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}
@end
