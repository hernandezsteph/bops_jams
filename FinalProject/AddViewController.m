//
//  ViewController.m
//  FinalProject
//
//  Created by Stephanie  Hernandez hern108@usc.edu.
//  Copyright © 2018 Stephanie  Hernandez. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *artistTF;
@property (weak, nonatomic) IBOutlet UITextField *locTF;
@property (weak, nonatomic) IBOutlet UITextField *songTF;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self enableSaveButton:self.artistTF.text loc:self.locTF.text song: self.songTF.text];
    if ([textField isEqual: self.artistTF]) {
        [self.locTF becomeFirstResponder];
    } 
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString *changedString = [textField.text
                               stringByReplacingCharactersInRange:range withString:string];
    
    if ([UITextView isEqual: self.artistTF]) {
        [self enableSaveButton: changedString
                           loc: self.locTF.text
                          song: self.songTF.text];
    }else if([textField isEqual: self.locTF]) {
        [self enableSaveButton: self.artistTF.text
                           loc: changedString
                          song: self.songTF.text];
    }
    return YES;
}

- (void)enableSaveButton: (NSString *) artist
                     loc: (NSString *) loc
                    song: (NSString *) song {
    
    self.saveButton.enabled = (artist.length > 0 &&
                               loc.length > 0 &&
                               song.length > 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
    if(self.block){
        self.block(self.artistTF.text, self.locTF.text, self.songTF.text);
    }
}

- (IBAction)cancelButton:(id)sender {
    if(self.block){
        self.block(nil, nil, nil);
    }
}

@end
