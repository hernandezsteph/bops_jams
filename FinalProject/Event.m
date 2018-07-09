//
//  Event.m
//  FinalProject
//
//  Created by Stephanie  Hernandez hern108@usc.edu.
//  Copyright © 2018 Stephanie  Hernandez. All rights reserved.
//

#import "Event.h"

@interface Event()

@end 

@implementation Event

- (instancetype) initWithArtist: (NSString*) artist
                       location: (NSString*) loc{
    self = [super init];
    if(self){
        _artist = artist;
        _location = loc;
    }
    return self;
}

- (instancetype) initWithArtist:(NSString *)artist
                       location:(NSString *)loc
                        favsong:(NSString *)song{
    self = [super init];
    if(self){
        _artist = artist;
        _location = loc;
        _favSong = song;
    }
    return self;
}

- (NSDictionary*) convertToDictionary{
    NSDictionary *eventDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   self.artist, @"artistID",
                                   self.location, @"locID",
                                   self.favSong, @"songID",
                                   nil];
    return eventDict;
    
}

@end
