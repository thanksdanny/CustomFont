//
//  ViewController.m
//  CustomFont2
//
//  Created by Danny Ho on 2/25/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *fontTableView;
@property (weak, nonatomic) IBOutlet UIButton *changeFontBtn;

@end

@implementation ViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { // datasource必需
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{ // datasource必须
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FontCell" forIndexPath:indexPath];
    cell.textLabel.text = @"shabi";
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fontTableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
