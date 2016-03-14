//
//  ViewController.m
//  HeaderControl
//
//  Created by Zakk Hoyt on 3/14/16.
//  Copyright © 2016 Zakk Hoyt. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "SectionView.h"
#import "TableViewCell.h"

@interface ViewController ()<HeaderViewDelegate>

@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) HeaderView *headerView;
@property(nonatomic, strong) UIView *tableHeaderView;
@property(nonatomic, strong) HeaderView *detachedView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    {
        UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]];
        [_tableView registerNib:nib forCellReuseIdentifier:@"TableViewCell"];
    }
    {
        UINib *nib = [UINib nibWithNibName:@"SectionView" bundle:[NSBundle mainBundle]];
        [_tableView registerNib:nib forHeaderFooterViewReuseIdentifier:@"SectionView"];
    }

    _headerView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] firstObject];
    _headerView.delegate = self;
    _tableView.tableHeaderView = _headerView;
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

- (void)headerView:(HeaderView *)headerView didChangeFrame:(CGRect)frame {
    _headerView = headerView;
    _tableView.tableHeaderView = headerView;
}

@end
