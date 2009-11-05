//
//  TopseeAppDelegate.m
//  Topsee
//
//  Created by Sam Dean on 04/11/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "TopseeAppDelegate.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation TopseeAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
	
	// Play the intro movie
	MPMoviePlayerController *moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"intro_animation" ofType:@"mov"]]];
	[moviePlayer play];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
