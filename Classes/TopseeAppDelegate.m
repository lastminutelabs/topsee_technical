//
//  TopseeAppDelegate.m
//  Topsee
//
//  Created by Sam Dean on 04/11/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "TopseeAppDelegate.h"

@implementation TopseeAppDelegate

@synthesize window;

// When the playback finishes, loop the movie
- (void) moviePlayBackDidFinish:(NSNotification*)notification {
	MPMoviePlayerController *player = (MPMoviePlayerController *)notification.object;
	player.initialPlaybackTime = 0.0f;
	[player play];
	[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {

    // Override point for customization after application launch
	movieFirstFrame = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]];
	[window addSubview:movieFirstFrame];
    [window makeKeyAndVisible];
	
	// Play the intro movie
	moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"idea4-turned" ofType:@"m4v"]]];
	moviePlayer.movieControlMode = MPMovieControlModeHidden;
	moviePlayer.backgroundColor = [UIColor clearColor];
	[moviePlayer play];
	
	// Keep the ui rotated correctly
	[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
	
	// Listen to the movie's notifications
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(moviePlayBackDidFinish:) 
												 name:MPMoviePlayerPlaybackDidFinishNotification 
											   object:moviePlayer];
    
    // Pretend that we are finding our location or talking to the server or somethin
    [NSTimer scheduledTimerWithTimeInterval:15.0 target:self selector:@selector(startupComplete:) userInfo:nil repeats:NO];
}

- (void) startupComplete:(NSTimer *)timer {
	// Stop listening to the movie player
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayer];
    [moviePlayer stop];
    [moviePlayer release];
    moviePlayer = nil;
    
    // Remove the first frame image and reveal the ui
    [movieFirstFrame removeFromSuperview];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
    [moviePlayer release];
    [window release];
    [super dealloc];
}

@end
