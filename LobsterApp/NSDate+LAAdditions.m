//
//  NSDate+LAAdditions.m
//  LobsterApp
//
//  Created by Rhys Powell on 22/12/12.
//  Copyright (c) 2012 Rhys Powell. All rights reserved.
//

#import "NSDate+LAAdditions.h"

@implementation NSDate (LAAdditions)

+ (NSDate *)parseDate:(id)dateStringOrDateNumber {
	// Return nil if nil is given
	if (!dateStringOrDateNumber || dateStringOrDateNumber == [NSNull null]) {
		return nil;
	}
	
	// Parse number
	if ([dateStringOrDateNumber isKindOfClass:[NSNumber class]]) {
		return [NSDate dateWithTimeIntervalSince1970:[dateStringOrDateNumber doubleValue]];
	}
	
	// Parse string
	else if ([dateStringOrDateNumber isKindOfClass:[NSString class]]) {
		// ISO8601 Parser borrowed from SSToolkit. http://sstoolk.it
		NSString *iso8601 = dateStringOrDateNumber;
		if (!iso8601) {
			return nil;
		}
		
		const char *str = [iso8601 cStringUsingEncoding:NSUTF8StringEncoding];
		char newStr[25];
		
		struct tm tm;
		size_t len = strlen(str);
		if (len == 0) {
			return nil;
		}
		
		// UTC
		if (len == 20 && str[len - 1] == 'Z') {
			strncpy(newStr, str, len - 1);
			strncpy(newStr + len - 1, "+0000", 5);
		}
		
		// Timezone
		else if (len == 25 && str[22] == ':') {
			strncpy(newStr, str, 22);
			strncpy(newStr + 22, str + 23, 2);
		}
		
		// Poorly formatted timezone
		else {
			strncpy(newStr, str, len > 24 ? 24 : len);
		}
		
		// Add null terminator
		newStr[sizeof(newStr) - 1] = 0;
		
		if (strptime(newStr, "%FT%T%z", &tm) == NULL) {
			return nil;
		}
		
		time_t t;
		t = mktime(&tm);
		
		return [NSDate dateWithTimeIntervalSince1970:t];
	}
	
	NSAssert1(NO, @"[SSRemoteManagedObject] Failed to parse date: %@", dateStringOrDateNumber);
	return nil;
}

@end
