//
//  main.c
//  spacefinder
//
//  Created by shabble on 04/03/2010.
//  
#include <Carbon/Carbon.h>
#include <stdio.h>

#include "CGSPrivate.h"

void set_space(int space) {
    // CFNotificationCenterRef center;
    // center = CFNotificationCenterGetDistributedCenter();
    // 
    // CFNotificationCenterPostNotification(
    //   center, 
    //   CFSTR("com.apple.switchSpaces"),
    //   NULL,
    //   (const void *)CFSTR("2"),
    //   TRUE);
  
    // NSString *noteName = @"com.apple.switchSpaces";
    // NSString *spaceID = [NSString stringWithFormat:@"%d", space];
    // NSNotificationCenter *dCenter = [NSDistributedNotificationCenter defaultCenter];
    // [dCenter postNotificationName:noteName object:spaceID];
  
    CGSConnection conn = _CGSDefaultConnection();
    CGSSetWorkspace(conn, space);
}

int get_space() {
    CFArrayRef winList = 
        CGWindowListCopyWindowInfo(kCGWindowListOptionOnScreenOnly, kCGNullWindowID);
  
    int len = CFArrayGetCount(winList);
    int i, num = 0;
    for (i = 0; i < len; i++) {
        CFDictionaryRef winDict = CFArrayGetValueAtIndex(winList, i);
        if (CFDictionaryContainsKey(winDict, kCGWindowWorkspace)) {
            //fprintf(stderr, "Yay, contains that key for i: %d\n", i);
            const void *thing = CFDictionaryGetValue(winDict, kCGWindowWorkspace);
            CFNumberRef numRef = (CFNumberRef)thing;
            CFNumberGetValue(numRef, kCFNumberIntType, &num);
            return num;
        }
    }
}

/*
    if (space == 0) {
        space = get_space();
        if (quiet_mode == 1) {
            fprintf(stdout, "%d\n", space);
        } else {
            fprintf(stdout, "Current Space ID: %d\n", space);
        }
    } else { 
        set_space(space);
        if (quiet_mode == 0)
            fprintf(stdout, "Switched to %d\n", space);
    }

}
*/