//
//  CollectionViewController.m
//  HeaderControl
//
//  Created by Zakk Hoyt on 4/1/16.
//  Copyright © 2016 Zakk Hoyt. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()
@property (nonatomic) NSInteger cellCount;
@end

@implementation CollectionViewController

static NSString *const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)didMoveToParentViewController:(nullable UIViewController *)parent {
//    [self.collectionView layoutSubviews];
//    [self reloadCollectionView];
//}

- (UIColor *)randomColorWithAlpha:(float)alpha {
    CGFloat red = (arc4random() % 0xFF) / (float)0xFF;
    CGFloat blue = (arc4random() % 0xFF) / (float)0xFF;
    CGFloat green = (arc4random() % 0xFF) / (float)0xFF;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //    [self.collectionView reloadData];
    //    [self reloadCollectionView];
}

- (void)reloadCollectionView {
    // Calculate size based on static cell height and layout
    _cellCount = arc4random_uniform(40) + 1;

    // Load the new number of cells
    [self.collectionView reloadData];

    //    [self.collectionView performBatchUpdates:^{
    //
    //    }
    //        completion:^(BOOL finished) {
    //                CGSize size = self.collectionView.contentSize;
    //                NSLog(@"cv.size: %@", NSStringFromCGSize(size));
    //                self.preferredContentSize = size;
    //        }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGSize size = self.collectionView.contentSize;
        NSLog(@"cv.size: %@", NSStringFromCGSize(size));
        self.preferredContentSize = size;

    });
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [self randomColorWithAlpha:1.0];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self reloadCollectionView];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.bounds.size.width / 2.0, 20);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)cv layout:(UICollectionViewLayout *)cvl insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

@end
