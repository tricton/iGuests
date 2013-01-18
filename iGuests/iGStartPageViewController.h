//
//  iGStartPageViewController.h
//  iGuests
//
//  Created by admin on 10.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iGDayTile.h"
#import "iGEditDay.h"

@interface iGStartPageViewController : UIViewController <UIGestureRecognizerDelegate>{
    NSMutableArray *dayButtons;
    NSMutableArray *dayLabels;
    NSMutableArray *dayRects;
    NSCalendar *mainCalendar;
    NSDate *currentShowingDate;
    UILabel *topDate;
    
}
@end
