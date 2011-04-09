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
	NSTimer	*nsTimerRef;
}
- (IBAction) stop:(id)pId;
-(IBAction)click:(id)sender;

@end
	

@interface spaces : NSObject {
	IBOutlet NSTextField *space_id;
}
-(IBAction)click:(id)sender;

@end

@interface change_space : NSObject {

}
-(IBAction)click:(id)sender;

@end
