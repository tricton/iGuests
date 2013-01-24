//
//  iGSelectedDate.h
//  iGuests
//
//  Created by admin on 23.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iGSelectedDate : NSObject{
    NSDate *selectedDate;
}

@property (nonatomic) NSDate *selectedDate;

+(iGSelectedDate *) sharedDate;

@end
