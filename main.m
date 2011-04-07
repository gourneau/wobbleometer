//
//  main.m
//  wobble
//
//  Created by Joshua Gourneau on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define DebugLog

//get unimotion header
#include "unimotion.h"

int main(int argc, char *argv[])
{

	// Insert code here to initialize your application 
	int sms_type;
	int x,y,z;
	sms_type = detect_sms();

	printf("hello world\n"); //shows up in console
	
	// Calibrate 'natural' positon with 20 readings

		int loop;	
		for(loop = 0; loop < 20; loop++) {
			int x, y, z;
			read_sms_scaled(sms_type, &x, &y, &z);
			NSLog(@"SMS Average - x = %d, y = %d, z = %d", x, y, z);
		}
	
	
	return NSApplicationMain(argc,  (const char **) argv);
}
