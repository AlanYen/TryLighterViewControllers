//
//  ALTableViewDataSource.h
//  TryLighterViewControllers
//
//  Created by Alan.Yen on 2016/3/8.
//  Copyright © 2016年 17Life. All rights reserved.
//

#import <UIKit/UIKit.h>

// 因為要復用，所以要寫成id類型
typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface ALTableViewDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

@end
