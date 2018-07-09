//
//  TableViewController.m
//  FinalProject
//
//  Created by Stephanie  Hernandez hern108@usc.edu.
//  Copyright © 2018 Stephanie  Hernandez. All rights reserved.
//

#import "TableViewController.h"
#import "EventModel.h"
#import "Event.h"
#import "AddViewController.h"
#import "DetailsViewController.h"

@interface TableViewController ()
@property (weak, nonatomic) EventModel* model;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [EventModel sharedModel];
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
    return [self.model numberOfEvents];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell" forIndexPath:indexPath];
    
    Event* eventcell = [self.model eventAtIndex:indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = [eventcell artist];
    
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"DetailsSegue" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
 if([segue.identifier isEqualToString:@"AddEventSegue"]){
     AddViewController* avc = [segue destinationViewController];
 
     avc.block = ^(NSString *artist, NSString *loc, NSString *song) {
         if(artist != nil && loc != nil && song != nil){
             [self.model insertWithArtist: artist loc: loc favesong: song];
             [self.model save];
             [self.tableView reloadData];
         }
         [self dismissViewControllerAnimated:YES completion:nil];
     };
    }
 else{
     NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
     DetailsViewController* dvc = [segue destinationViewController];
     dvc.currindex = indexPath.row;
 }
 
 }


@end
