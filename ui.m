//
//  ui.m
//  wobble
//
//  Created by Joshua Gourneau on 4/7/11.

#import "ui.h"

#define DebugLog

//get unimotion header
#include "unimotion.h"

//get the space
//#include "space_set.h"

@implementation ui
- (IBAction)click:(id)sender;
{
	if (nsTimerRef) {
		[nsTimerRef invalidate];
		nsTimerRef	= nil; 
	}
	nsTimerRef	= [NSTimer	scheduledTimerWithTimeInterval:0.05 
							target:self 
							selector:@selector(ticker) 
							userInfo:NULL 
							repeats:YES
				   ];
	
}

- (IBAction) stop:(id)pId {
	[nsTimerRef invalidate];
	nsTimerRef	= nil;
	
} // end stopAnimation

- (void) ticker {
	
	int sms_type;
	sms_type = detect_sms();

	int motion_x, motion_y, motion_z;
	read_sms_scaled(sms_type, &motion_x, &motion_y, &motion_z);
	NSLog(@"SMS Average - x = %d, y = %d, z = %d", motion_x, motion_y, motion_z);
	[x setIntValue:(motion_x)];
	[y setIntValue:(motion_y)];
	[z setIntValue:(motion_z)];
	if (motion_x <= -20 ){
		int space_number = 2;
		//set_space(space_number,true);
		NSLog(@"trying to go to space 2");
	}
	if (motion_x >= 20){
		int space_number = 1;
		//set_space(space_number,true);
		NSLog(@"going to space 1");
	}
	
	
}




@end



