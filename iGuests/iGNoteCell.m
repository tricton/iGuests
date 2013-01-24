//
//  iGNoteCell.m
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGNoteCell.h"

@implementation iGNoteCell

@synthesize cellLabel, cellTextView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect mainFrame = self.contentView.bounds;
        cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(mainFrame.origin.x, mainFrame.origin.y, mainFrame.size.width, 20)];
        cellLabel.text = @"Сделать заметку";
        [cellLabel setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
        [cellLabel setTextAlignment:NSTextAlignmentCenter];
        cellTextView = [[UITextView alloc] initWithFrame:CGRectMake(mainFrame.origin.x, mainFrame.origin.y + 20, mainFrame.size.width, 80)];
        [cellTextView setReturnKeyType:UIReturnKeyDone];

        [self.contentView addSubview:cellLabel];
        [self.contentView addSubview:cellTextView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:NO animated:NO];

    // Configure the view for the selected state
}

@end
