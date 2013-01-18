//
//  iGSwitchedCell.m
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGSwitchedCell.h"

@implementation iGSwitchedCell

@synthesize cellLabel, cellPictogramm, cellSwitch;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect mainFrame = self.contentView.bounds;
        cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(mainFrame.origin.x + 45, mainFrame.origin.y, 190, mainFrame.size.height)];
        cellLabel.font = [UIFont systemFontOfSize:16];
        [cellLabel setTextAlignment:NSTextAlignmentLeft];
        [cellLabel setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
        cellPictogramm = [[UIImageView alloc] initWithFrame:CGRectMake(mainFrame.origin.x + 2, mainFrame.origin.y + 2, mainFrame.size.height - 4, mainFrame.size.height - 4)];
        cellSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(mainFrame.origin.x + 240, mainFrame.origin.y + 7, 60, 38)];
        //[cellSwitch setOn:NO];
        [self.contentView addSubview:cellSwitch];
        [self.contentView addSubview:cellPictogramm];
        [self.contentView addSubview:cellLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:NO animated:NO];

    // Configure the view for the selected state
}

@end
