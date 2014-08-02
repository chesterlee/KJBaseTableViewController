//
//  KJBaseTableViewController.m
//  KJBaseTableView
//
//  Created by lee chester on 8/2/14.
//  Copyright (c) 2014 Chester. All rights reserved.
//

#import "KJBaseTableViewController.h"
#import "SVPullToRefresh.h"

@interface KJBaseTableViewController ()

/**
 *  construct the refresh view
 */
- (void)constructRefreshView;

/**
 *  construct the load more view
 */
- (void)constructInfiniteScrolling;

@end

@implementation KJBaseTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.beShowRefreshView)
    {
        [self constructRefreshView];
    }
    
    if (self.beShowLoadMoreView)
    {
        [self constructInfiniteScrolling];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setHasMore:(BOOL)hasMore
{
    [self.tableView setShowsInfiniteScrolling:hasMore];
}

- (void)setHasRefresh:(BOOL)hasMore
{
    self.refreshControl = nil;
}

- (void)didRefreshFinished
{
    [self.refreshControl endRefreshing];
}

- (void)didLoadMoreFinished
{
     [self.tableView.infiniteScrollingView stopAnimating];
}


#pragma mark - Refresh Refer
- (void)constructRefreshView
{
    self.refreshControl = [[UIRefreshControl alloc]init];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@""];
    [self.refreshControl addTarget:self action:@selector(refreshViewControlEventValueChanged)
                  forControlEvents:UIControlEventValueChanged];
}

-(void)refreshViewControlEventValueChanged
{
    if (self.refreshControl.refreshing)
    {
        self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@""];
        [self doRequest:RequestType_Refresh];
    }
}

#pragma mark - Infinite Scroll Refer
- (void)constructInfiniteScrolling
{
    __block KJBaseTableViewController *_self = self;
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [_self doRequest:RequestType_LoadMore];
    }];
}

#pragma mark - need override
- (void)doRequest:(RequestType)type
{
    //baseTableViewController do nothing here, subclass can override the
    //function to do network request
    NSLog(@"request type = %d",type);
    
}

#pragma mark - KJBaseTableViewControllerDelegate

- (BOOL)beShowLoadMoreView
{
    return YES;
}

- (BOOL)beShowRefreshView
{
    return YES;
}

@end
