//
//  KJBaseTableViewController.h
//  KJBaseTableView
//
//  Created by lee chester on 8/2/14.
//  Copyright (c) 2014 Chester. All rights reserved.
//

#import <UIKit/UIKit.h>

// Request Type
typedef NS_OPTIONS(NSInteger, RequestType)
{
    RequestType_Refresh,    // Refresh
    RequestType_LoadMore,   // LoadMore
};

@protocol KJBaseTableViewControllerDelegate <NSObject>

@required
/**
 *  ask if need loadmore view, return YES, KJBaseTableViewController will load it
 *  actually you can init your own load more view by yourself
 */
- (BOOL)beShowLoadMoreView;

/**
 *  ask if need refresh view, return YES, KJBaseTableViewController will load it
 *  actually you can init your own refresh view by yourself
 */
- (BOOL)beShowRefreshView;

@end


@interface KJBaseTableViewController : UITableViewController<KJBaseTableViewControllerDelegate>

/**
 *  set there has more，it indicate wheather the table view will show the 'load more' view
 *  this is the 'after init' metheod to control the show of the load more view
 */
- (void)setHasMore:(BOOL)hasMore;

/**
 *  set there has refresh，it indicate wheather the table view will show the 'refresh ' view
 *  this is the 'after init' metheod to control the show of the refresh view
 */
- (void)setHasRefresh:(BOOL)hasMore;

/**
 *  when you finish refresh data from network, you'll call it
 */
- (void)didRefreshFinished;

/**
 *  when you finish load more data from network, you'll call it
 */
- (void)didLoadMoreFinished;

#pragma mark-   子类需要重写

/**
 *  do network request, you can distinguish the RequestType and call different network method
 *
 *  @param type request type,load more or refresh
 */
- (void)doRequest:(RequestType)type;


@end
