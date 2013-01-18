//
//  iGSymptoms.h
//  iGuests
//
//  Created by admin on 16.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iGSymptomsCell.h"

@interface iGSymptoms : UITableViewController <UITableViewDataSource, UITableViewDelegate>{
    UITableView *symptomsTableView;
    NSArray *symptoms;
}

@end
