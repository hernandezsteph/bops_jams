//
//  Event.h
//  FinalProject
//
//  Created by Stephanie  Hernandez hern108@usc.edu.
//  Copyright © 2018 Stephanie  Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (strong, nonatomic) NSString* artist;
@property (strong, nonatomic) NSString* location;
@property (strong, nonatomic) NSString* favSong;

- (instancetype) initWithArtist: (NSString*) artist
                       location: (NSString*) loc;

- (instancetype) initWithArtist:(NSString *)artist
                       location:(NSString *)loc
                        favsong:(NSString *)song;

- (NSDictionary*) convertToDictionary;

@end
