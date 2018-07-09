//
//  EventViewController.m
//  FinalProject
//
//  Created by Stephanie  Hernandez hern108@usc.edu.
//  Copyright © 2018 Stephanie  Hernandez. All rights reserved.
//

#import "EventViewController.h"
#import "EventModel.h"
#import "Event.h"

@interface EventViewController ()
@property (weak, nonatomic) EventModel* model;
@property (strong, nonatomic) IBOutlet UITableView *eventTableView;
@end

@implementation EventViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.model = [EventModel sharedModel];
}

- (void) viewWillAppear:(BOOL)animated{
    [self.eventTableView reloadData];
}

-(void) viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model numberOfConcerts];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"concertCell" forIndexPath:indexPath];
    
    NSArray* concerts = [self.model newConcerts];
    Event* new = [concerts objectAtIndex:indexPath.row];
    // Configure the cell...
    cell.textLabel.text = [new artist];
    cell.detailTextLabel.text = [new location]; 
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
