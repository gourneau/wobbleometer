//
//  ui.h
//  wobble
//
//  Created by Joshua Gourneau on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ui : NSObject {
	IBOutlet NSTextField *x;
	IBOutlet NSTextField *y;
	IBOutlet NSTextField *z;


}
-(IBAction)click:(id)sender;

@end
	