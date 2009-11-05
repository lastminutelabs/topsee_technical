//
//  TopseeAppDelegate.h
//  Topsee
//
//  Created by Sam Dean on 04/11/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface TopseeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    
    MPMoviePlayerController *moviePlayer;
	UIImageView *movieFirstFrame;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

