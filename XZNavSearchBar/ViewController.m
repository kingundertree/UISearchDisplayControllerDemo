//
//  ViewController.m
//  XZNavSearchBar
//
//  Created by xiazer on 14/12/12.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchDisplayDelegate, UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UISearchDisplayController *searchController;
@property(nonatomic,strong) UISearchBar *searchBar;
@property(nonatomic,strong) UITableView *tableList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Nav test";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView    = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate        = self;
    tableView.dataSource      = self;
    tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    UISearchBar *searchBar    = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, 320, 44)];
    searchBar.delegate        = self;
    searchBar.placeholder     = @"搜索";
    searchBar.tintColor       = [UIColor blackColor];
    searchBar.keyboardType    = UIKeyboardTypeDefault;
    searchBar.backgroundColor = [UIColor clearColor];
    [searchBar setImage:[UIImage imageNamed:@"broker_seach_icon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    _searchBar = searchBar;
    
    UISearchDisplayController *searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.delegate                = self;
    searchDisplayController.searchResultsDelegate   = self;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _searchController = searchDisplayController;

    tableView.tableHeaderView = searchBar;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    
    if (tableView == self.searchController.searchResultsTableView) {
        cell.textLabel.text = @"rush lifer!";
    } else {
        cell.textLabel.text = @"rush life";
    }
    
    
    return cell;
}

#pragma mark - -- UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    
    UITableView *newTable = self.searchController.searchResultsTableView;
    [newTable reloadData];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
