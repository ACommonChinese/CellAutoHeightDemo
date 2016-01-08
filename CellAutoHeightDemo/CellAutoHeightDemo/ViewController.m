//
//  ViewController.m
//  CellAutoHeightDemo
//
//  Created by 刘威振 on 16/1/8.
//  Copyright © 2016年 LiuWeiZhen. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "Model.h"
#import "MyCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic)UITableView *tableView;
@property(nonatomic)NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    
    // [self fetchData];
    [self performSelector:@selector(fetchData) withObject:nil afterDelay:3];
}

//增加 tableView
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    
    //self.tableView.rowHeight = 44.0;
    //self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44; // Some average height of your cells
    
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
    [self.view addSubview:_tableView];
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

//获取数据
- (void)fetchData {
    Model *model_1 = [[Model alloc] init];
    model_1.imageUrl = @"http://farm3.staticflickr.com/2846/9823925914_78cd653ac9_b_d.jpg"; // http://farm3.staticflickr.com/2831/9823890176_82b4165653_b_d.jpg
    model_1.message = @"This is model 1 message";
    [self.dataArray addObject:model_1];
    
    Model *model_2 = [[Model alloc] init];
    model_2.imageUrl = @"http://yamei.uumatch.com/ueditor/php/upload/image/20151215/1450168390842501.png";
    model_2.message = @"This is model 2 message test by liuxing8807@126.co a common chinese hello world hello china";
    [self.dataArray addObject:model_2];
    
    [self.tableView reloadData];
}

#pragma mark --
#pragma mark - <UITableViewDataSource, UITableViewDelegate>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // AppModel *model = self.dataArray.count > 0 ? self.dataArray[0] : nil;
    // return model.aa.count;
    return self.dataArray.count;
}

//创建 cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    cell.indexPath = indexPath;
    __weak __typeof(tableView)weakTableView = tableView;
    __weak __typeof(cell)weakCell = cell;
    cell.refreshHandler = ^() {
        [weakTableView reloadRowsAtIndexPaths:@[weakCell.indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    Model *model = [self.dataArray objectAtIndex:indexPath.row];
    // NSLog(@"model.imageUrl: %@", model.imageUrl);
    cell.model = model;
    return cell;
}

@end
