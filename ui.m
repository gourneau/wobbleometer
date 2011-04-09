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
#include "space_set.h"

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
		
	
	
}




@end

@implementation spaces
- (IBAction)click:(id)sender;
{
	
	int space_id_var;
	
	space_id_var = get_space();
	
	NSLog(@"Space ID - x = %d, y = %d, z = %d", space_id_var);
	[space_id setIntValue:(space_id_var)];
	
	
}






@end


@implementation change_space
- (IBAction)click:(id)sender;
{
	
	int space_number = 2;
	
	set_space(space_number);
	
	NSLog(@"Space changed to  %d", space_number);

	
	
}

@end


