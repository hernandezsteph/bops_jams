//
//  EventModel.h
//  FinalProject
//
//  Created by Stephanie  Hernandez hern108@usc.edu.
//  Copyright © 2018 Stephanie  Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface EventModel : NSObject

@property (nonatomic, readonly) NSUInteger currentIndex;

// creating the model
+ (instancetype) sharedModel;

// Accessing number of events in model
- (NSUInteger) numberOfEvents;

-(NSUInteger) numberOfConcerts; 

// Accessing a flashcard - sets currentIndex appropriately
- (Event* ) eventAtIndex: (NSUInteger) index;

// inserting a Flashcard
- (void) insertWithConcert: (NSString *) artist
                      loc: (NSString *) location;

- (void) insertWithArtist: (NSString *) artist
                      loc: (NSString *) location
                 favesong: (NSString *) song;

// Removing a Flashcard
- (void) removeEvent;
- (void) removeEventAtIndex: (NSUInteger) index;

- (NSArray*) newConcerts; 

- (void) save;

@end
