//
//  iGDisclosureCell.h
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iGDisclosureCell : UITableViewCell{
    UIImageView *cellPictogramm;
    UILabel *cellLabel;
    UIImageView *cellShevron;
}

@property ( nonatomic) UIImageView *cellPictogramm;
@property ( nonatomic) UILabel *cellLabel;

@end
