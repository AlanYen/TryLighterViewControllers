//
//  ALTableViewDataSource.m
//  TryLighterViewControllers
//
//  Created by Alan.Yen on 2016/3/8.
//  Copyright © 2016年 17Life. All rights reserved.
//

#import "ALTableViewDataSource.h"

@interface ALTableViewDataSource ()

@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSString *cellIdentifier;
@property (copy, nonatomic) TableViewCellConfigureBlock configureBlock;

@end

@implementation ALTableViewDataSource

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock {
    
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    id cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                              forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureBlock(cell, item);
    return cell;
}

- (NSInteger)tableView:(UITableView*)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return (NSInteger)[self.items count];
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    
    return (id)[self.items objectAtIndex:indexPath.row];
}

@end