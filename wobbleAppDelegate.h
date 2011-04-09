//
//  wobbleAppDelegate.h
//  wobble
//
//  Created by Joshua Gourneau on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface wobbleAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}


@property (assign) IBOutlet NSWindow *window;

@end
