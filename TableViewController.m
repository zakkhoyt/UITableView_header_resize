//
//  TableViewController.m
//  HeaderControl
//
//  Created by Zakk Hoyt on 4/1/16.
//  Copyright © 2016 Zakk Hoyt. All rights reserved.
//

#import "TableViewController.h"
#import "SectionView.h"
#import "TableViewCell.h"

@interface TableViewController ()
@property (weak, nonatomic) IBOutlet UIView *tableHeaderContainerView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super viewDidLoad];

    {
        UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]];
        [self.tableView registerNib:nib forCellReuseIdentifier:@"TableViewCell"];
    }
    {
        UINib *nib = [UINib nibWithNibName:@"SectionView" bundle:[NSBundle mainBundle]];
        [self.tableView registerNib:nib forHeaderFooterViewReuseIdentifier:@"SectionView"];
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id<UIContentContainer>)container {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super preferredContentSizeDidChangeForChildContentContainer:container];

    NSLog(@"preferredContentSize = %@", NSStringFromCGSize([container preferredContentSize]));
    CGSize size = [container preferredContentSize];
    _tableHeaderContainerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, size.height);
    self.tableView.tableHeaderView = _tableHeaderContainerView;

    [UIView animateWithDuration:0.3 animations:^{
        [self.tableView layoutIfNeeded];
    }];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %lu", (unsigned long)indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SectionView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SectionView"];
    view.textLabel.text = [NSString stringWithFormat:@"Section %lu", (unsigned long)section];
    view.detailTextLabel.text = [NSString stringWithFormat:@"Section %lu", (unsigned long)section];
    return view;
}

@end
