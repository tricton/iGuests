//
//  iGSymptomsCell.m
//  iGuests
//
//  Created by admin on 16.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGSymptomsCell.h"

@implementation iGSymptomsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect mainFrame = self.contentView.bounds;
        cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(mainFrame.origin.x + 2, mainFrame.origin.y + 2, 200, 40)];
        cellLabel.font = [UIFont systemFontOfSize:16];
        [cellLabel setTextAlignment:NSTextAlignmentLeft];
        [cellLabel setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
        cellSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(mainFrame.origin.x + 240, mainFrame.origin.y + 7, 60, 38)];
//        [cellSwitch setOn:NO];
//        [cellSwitch setOn:NO];
        [self.contentView addSubview:cellSwitch];
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
