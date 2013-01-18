//
//  iGNoteCell.h
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iGNoteCell : UITableViewCell{
    UILabel *cellLabel;
    UITextView *cellTextView;
}

@property (nonatomic) UILabel *cellLabel;
@property (nonatomic) UITextView *cellTextView;

@end
