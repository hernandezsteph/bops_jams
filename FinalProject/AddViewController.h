//
//  ViewController.h
//  FinalProject
//
//  Created by Stephanie  Hernandez hern108@usc.edu.
//  Copyright © 2018 Stephanie  Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
typedef void(^AddEvent)(NSString* artist, NSString* location, NSString* favSong);
@property (copy, nonatomic) AddEvent block; 

@end

