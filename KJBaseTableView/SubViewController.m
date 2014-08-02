//
//  SubViewController.m
//  KJBaseTableView
//
//  Created by lee chester on 8/2/14.
//  Copyright (c) 2014 Chester. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self setHasRefresh:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath];
    return cell;
}

-(void)doRequest:(RequestType)type
{
    [super doRequest:type];
    NSLog(@"sub request");
    if (RequestType_Refresh == type)
    {
        [self performSelector:@selector(didRefreshFinished) withObject:nil afterDelay:2];
    }
    else if (RequestType_LoadMore == type)
    {
        [self performSelector:@selector(didLoadMoreFinished) withObject:nil afterDelay:2];
    }
}

/**
 *  是否需要加载更多控件，默认YES
 */
- (BOOL)beShowLoadMoreView
{
    return YES;
}

/**
 *  是否需要加载刷新控件，默认YES
 */
- (BOOL)beShowRefreshView
{
    return NO;
}

@end
