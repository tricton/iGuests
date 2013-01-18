//
//  iGDisclosureCell.m
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGDisclosureCell.h"

@implementation iGDisclosureCell

@synthesize cellLabel, cellPictogramm;

- (id) initWithStyle:(UITableViewCellStyle)style
     reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect mainFrame = self.contentView.bounds;
        cellLabel = [[UILabel alloc] init];
        cellLabel.textAlignment = NSTextAlignmentLeft;
        cellLabel.font = [UIFont systemFontOfSize:16];
        cellLabel.text = @"Симптомы";
        [cellLabel setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
        cellPictogramm = [[UIImageView alloc] init];
        [self.contentView addSubview:cellLabel];
        [self.contentView addSubview:cellPictogramm];
        cellLabel.frame = CGRectMake(mainFrame.origin.x + 45, mainFrame.origin.y, 230, mainFrame.size.height);
        cellPictogramm.frame = CGRectMake(mainFrame.origin.x + 5, mainFrame.origin.y + 2, mainFrame.size.height - 10, mainFrame.size.height - 4);
        cellShevron = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shervon.png"]];
        cellShevron.frame = CGRectMake(mainFrame.origin.x + 280, mainFrame.origin.y + 5, 17, 34);
        [self.contentView addSubview:cellShevron];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:NO animated:NO];
}

@end
