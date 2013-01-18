//
//  iGSwitchedCell.h
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iGSwitchedCell : UITableViewCell{
    UISwitch *cellSwitch;
    UIImageView *cellPictogramm;
    UILabel *cellLabel;
}

@property (nonatomic) UISwitch *cellSwitch;
@property (nonatomic) UILabel *cellLabel;
@property (nonatomic) UIImageView *cellPictogramm;

@end
