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

// When the playback finishes, loop the movie
- (void) moviePlayBackDidFinish:(NSNotification*)notification {
	MPMoviePlayerController *moviePlayer = (MPMoviePlayerController *)notification.object;
	moviePlayer.initialPlaybackTime = 0.0f;
	[moviePlayer play];
	[[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO];
	[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {

    // Override point for customization after application launch
	movieFirstFrame = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]];
	[window addSubview:movieFirstFrame];
    [window makeKeyAndVisible];
	
	// Play the intro movie
	MPMoviePlayerController *moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"intro_animation" ofType:@"mov"]]];
	moviePlayer.movieControlMode = MPMovieControlModeHidden;
	moviePlayer.backgroundColor = [UIColor clearColor];
	[moviePlayer play];
	
	// Keep the ui rotated correctly
	[[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO];
	[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
	
	// Listen to the movie's notifications
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(moviePlayBackDidFinish:) 
												 name:MPMoviePlayerPlaybackDidFinishNotification 
											   object:moviePlayer];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}

@end
