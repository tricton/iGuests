//
//  iGEditDay.h
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iGDisclosureCell.h"
#import "iGEditedCell.h"
#import "iGSwitchedCell.h"
#import "iGSmileCell.h"
#import "iGNoteCell.h"
#import "iGSymptoms.h"

@interface iGEditDay : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UITextViewDelegate, UIGestureRecognizerDelegate>{
    iGDisclosureCell *discloseCell;
    iGEditedCell *editedCell;
    iGSwitchedCell *switchedCell;
    iGSmileCell *smileCell;
    iGNoteCell *noteCell;
    UITableView *editTableView;
   }

@end
