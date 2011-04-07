//
//  ui.m
//  wobble
//
//  Created by Joshua Gourneau on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ui.h"

#define DebugLog

//get unimotion header
#include "unimotion.h"



@implementation ui
- (IBAction)click:(id)sender;
{
	// Insert code here to initialize your application 
	int sms_type;
	sms_type = detect_sms();
	
	
	int loop;	
	for(loop = 0; loop < 20; loop++) {
		int motion_x, motion_y, motion_z;
		read_sms_scaled(sms_type, &motion_x, &motion_y, &motion_z);
		NSLog(@"SMS Average - x = %d, y = %d, z = %d", motion_x, motion_y, motion_z);
		[x setIntValue:(motion_x)];
		[y setIntValue:(motion_y)];
		[z setIntValue:(motion_z)];

	}
	
	
	
	
}
@end
