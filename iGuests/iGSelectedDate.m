//
//  iGSelectedDate.m
//  iGuests
//
//  Created by admin on 23.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGSelectedDate.h"

@implementation iGSelectedDate

@synthesize selectedDate;

+(iGSelectedDate *) sharedDate{
    static iGSelectedDate *singltone = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{singltone = [[super allocWithZone:nil] init];});
    return  singltone;
}

+(id) allocWithZone:(NSZone *)zone{
    return [self sharedDate];
}

@end
