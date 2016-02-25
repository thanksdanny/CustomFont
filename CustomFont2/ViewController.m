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
    return @[@"30 Days Swift", @"这些字体特别适合打「奋斗」和「理想」", @"谢谢「造字工房」，本案例不涉及商业使用", @"使用到造字工房劲黑体，致黑体，童心体", @"呵呵，再见🤗 See you next Project", @"微博"];
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
