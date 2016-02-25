//
//  ViewController.m
//  CustomFont2
//
//  Created by Danny Ho on 2/25/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

{
    int fontRowIndex;
}

@property (weak, nonatomic) IBOutlet UITableView *fontTableView;
@property (weak, nonatomic) IBOutlet UIButton *changeFontBtn;
@end

@implementation ViewController

#pragma mark - 按钮

- (IBAction)changeFont {
    NSLog(@"%s", __func__);
    fontRowIndex = (fontRowIndex + 1) % 3;
    [self.fontTableView reloadData];
}


# pragma mark - tools

- (NSArray *)data {
    return @[@"这是第一行", @"麻痹终于明白这demo了", @"终于可以特么写点东西", @"又可以传github去咯", @"一天一个demo坚持啊", @"啊"];
}

- (NSArray *)fontNames {
    return @[@"MFTongXin_Noncommercial-Regular", @"MFJinHei_Noncommercial-Regular", @"MFZhiHei_Noncommercial-Regular"];
}


#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { // datasource必需
    return [[self data] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{ // datasource必须
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FontCell" forIndexPath:indexPath];
    cell.textLabel.text = [self data][indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:[self fontNames][fontRowIndex] size:16];
    
    return cell;
}

# pragma mark - viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fontTableView.dataSource = self;
    
//    for (NSString *family in [UIFont familyNames]) {
//        for (NSString *font in [UIFont fontNamesForFamilyName:family]) {
//            NSLog(@"%@", font);
//        }
//    }
    self.changeFontBtn.layer.cornerRadius = 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
