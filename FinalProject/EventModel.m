//
//  EventModel.m
//  FinalProject
//
//  Created by Stephanie  Hernandez hern108@usc.edu.
//  Copyright © 2018 Stephanie  Hernandez. All rights reserved.
//

#import "EventModel.h"

@interface EventModel()

@property (strong, nonatomic) NSMutableArray* events;
@property (strong, nonatomic) NSMutableArray* concerts;

@property (strong, nonatomic) NSString* filepath;

@end

@implementation EventModel

- (instancetype) init {
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = paths[0];
        //NSLog(@"docDir = %@", self.filepath);
        self.filepath = [documentsDirectory stringByAppendingPathComponent:@"events.plist"];
        //NSLog(@"filepath = %@", self.filepath);
        
        NSMutableArray *data = [NSMutableArray arrayWithContentsOfFile: self.filepath];
        
        if(!data){
            self.events = [[NSMutableArray alloc] init];
            Event* event1 = [[Event alloc] initWithArtist:@"Harry Styles" location:@"Los Angeles,CA" favsong:@"Kiwi"];
            Event* event2 = [[Event alloc] initWithArtist:@"Drake" location:@"Los Angeles,CA" favsong:@"Nice For What"];
            Event* event3 = [[Event alloc] initWithArtist:@"Cardi B" location:@"Los Angeles,CA" favsong:@"Be Careful"];
            [self.events addObject: event1];
            [self.events addObject: event2];
            [self.events addObject: event3];
            [self save];
        }
        else {
            self.events = [[NSMutableArray alloc] init];
            for(NSDictionary* dict in data){
                Event *currevent = [[Event alloc] initWithArtist: dict[@"artistID"] location: dict[@"locID"] favsong: dict[@"songID"]];
                [self.events addObject: currevent];
            }
        }
        
        self.concerts = [[NSMutableArray alloc] init];
        NSError *error;
        NSString *url_string = [NSString stringWithFormat: @"https://api.seatgeek.com/2/events?client_id=Nzc4ODQ5fDE1MjU0MTM5MzcuNzg"];
        NSData *data2 = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
        NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data2 options:kNilOptions error:&error];
        //NSLog(@"json: %@", json);
        NSArray* events = [json valueForKey:@"events"];
        for(NSDictionary* concert in events){
            NSString* artist = [concert objectForKey:@"short_title"];
            NSDictionary* venue = [concert valueForKey:@"venue"];
            NSString* loc = [venue objectForKey:@"city"];
            Event* event = [[Event alloc] initWithArtist:artist location:loc];
            [self.concerts addObject: event];
        }
        
        _currentIndex = 0;
    }
    return self;
    
}

// creating the model
+ (instancetype) sharedModel{
    static EventModel* _sharedModel = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedModel = [[self alloc] init];
    });
    return _sharedModel;
}

// Accessing number of events in model
- (NSUInteger) numberOfEvents{
    return self.events.count;
}

- (NSUInteger) numberOfConcerts {
    return self.concerts.count;
}

// Accessing a Event - sets currentIndex appropriately
- (Event* ) eventAtIndex: (NSUInteger) index{
    Event* found;
    _currentIndex = index;
    if(index < [self numberOfEvents]){
        found = [self.events objectAtIndex:index];
    }
    return found;}

// inserting a Event
- (void) insertWithConcert: (NSString *) artist
                      loc: (NSString *) location{
    Event* newEvent = [[Event alloc]
                          initWithArtist: artist
                                location: location];
    [self.concerts addObject: newEvent];
    //[self save];
}

- (void) insertWithArtist: (NSString *) artist
                      loc: (NSString *) location
                 favesong: (NSString*) song{
    Event* newEvent = [[Event alloc]
                       initWithArtist: artist
                       location: location
                       favsong: song];
    [self.events addObject: newEvent];
    
    [self save];
}

// Removing an Event
- (void) removeEvent{
    if([self numberOfEvents] > 0){
        [self.events removeLastObject];
    }
    
    [self save];
}

- (void) removeEventAtIndex: (NSUInteger) index{
    if(index < [self numberOfEvents]){
        [self.events removeObjectAtIndex:index];
    }
    
    [self save];
}

- (NSArray*) newConcerts {
    return self.concerts; 
}

- (void) save{
    NSMutableArray *newCards = [[NSMutableArray alloc] init];
    for(Event* event in self.events){
        NSDictionary *eventDict = [event convertToDictionary];
        [newCards addObject: eventDict];
    }
    
    [newCards writeToFile: self.filepath atomically: YES];
}

@end
