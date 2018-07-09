//
//  DetailsViewController.m
//  FinalProject
//
//  Created by Stephanie  Hernandez hern108@usc.edu.
//  Copyright © 2018 Stephanie  Hernandez. All rights reserved.
//

#import "DetailsViewController.h"
#import "EventModel.h"
#import "Event.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *locLabel;
@property (weak, nonatomic) IBOutlet UILabel *songLabel;

@property (strong, nonatomic) EventModel* model;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [EventModel sharedModel];
    [self insertData];
    // Do any additional setup after loading the view.
}
// update the labels so show right information 
- (void) insertData {
    Event* event = [self.model eventAtIndex: _currindex];
    self.artistLabel.text = event.artist;
    self.locLabel.text = event.location;
    self.songLabel.text = event.favSong;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil]; 
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
