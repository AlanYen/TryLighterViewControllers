//
//  ViewController.m
//  TryLighterViewControllers
//
//  Created by AlanYen on 2016/3/8.
//  Copyright © 2016年 17Life. All rights reserved.
//

#import "ViewController.h"
#import "ALTableViewDataSource.h"
#import "CustomCellModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ALTableViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource =
    [[ALTableViewDataSource alloc] initWithItems:[self items]
                                  cellIdentifier:@"Cell"
                              configureCellBlock:^(id cell, id item)
    {
        CustomCellModel *m = (CustomCellModel *)item;
        UITableViewCell *customCell = (UITableViewCell *)cell;
        customCell.textLabel.text = m.title;
        customCell.detailTextLabel.text = m.content;
    }];
    
    self.tableView.dataSource = self.dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)items {
    
    NSMutableArray *datas = [NSMutableArray new];
    for (NSInteger i = 0; i < 10; i++) {
        CustomCellModel *m = [[CustomCellModel alloc] init];
        m.title = [NSString stringWithFormat:@"Title %zd", (i + 1)];
        m.content = [NSString stringWithFormat:@"this is test %zd", (i + 1)];
        [datas addObject:m];
    }
    return (NSArray *)datas;
}

@end
