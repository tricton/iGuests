//
//  iGEditedCell.m
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGEditedCell.h"

@implementation iGEditedCell

@synthesize cellField, cellLabel, cellLabel2, cellPictogramm, doneButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect mainFrame = self.contentView.bounds;
        cellPictogramm = [[UIImageView alloc] initWithFrame:CGRectMake(mainFrame.origin.x +2, mainFrame.origin.y + 2, mainFrame.size.height - 4, mainFrame.size.height - 4)];
        cellField = [[UITextField alloc] initWithFrame:CGRectMake(mainFrame.origin.x + 250, mainFrame.origin.y + 7, 50, 30)];
        [cellField setBorderStyle:UITextBorderStyleRoundedRect];
        [cellField setKeyboardType:UIKeyboardTypeDecimalPad];
        [cellField setKeyboardAppearance:UIKeyboardAppearanceAlert];
        [cellField setTextAlignment:NSTextAlignmentCenter];
        
        cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(mainFrame.origin.x + 45, mainFrame.origin.y, 200, mainFrame.size.height)];
        cellLabel.font = [UIFont systemFontOfSize:16];
        [cellLabel setTextAlignment:NSTextAlignmentLeft];
        [cellLabel setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
        cellLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(mainFrame.origin.x + 302, mainFrame.origin.y + 11, 20,20)];
        cellLabel2.font = [UIFont systemFontOfSize:12];
        [cellLabel2 setTextAlignment:NSTextAlignmentCenter];

        [self.contentView addSubview:cellPictogramm];
        [self.contentView addSubview:cellField];
        [self.contentView addSubview:cellLabel];
        [self.contentView addSubview:cellLabel2];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:NO animated:NO];
    
    // Configure the view for the selected state
}

@end
