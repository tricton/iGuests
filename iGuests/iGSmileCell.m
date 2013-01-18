//
//  iGSmileCell.m
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGSmileCell.h"

@implementation iGSmileCell

@synthesize happyButton, sadButton, pockerFaceButton, angryButton, depressButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect mainFrame = self.contentView.bounds;
        int widht = mainFrame.size.width;
//        self.contentView.bounds.size.height = 60;
        CGPoint size;
        size.x = mainFrame.origin.x;
        size.y = mainFrame.origin.y;
        myFeeling = [[UILabel alloc] initWithFrame:CGRectMake(size.x, size.y, widht, 10)];
        myFeeling.text = @"МОЁ СЕГОДНЯШНЕЕ НАСТРОЕНИЕ";
        myFeeling.font = [UIFont systemFontOfSize:10];
        [myFeeling setTextAlignment:NSTextAlignmentCenter];
        [myFeeling setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
        happyLabel = [[UILabel alloc] initWithFrame:CGRectMake(size.x + 10,size.y + 50, 60, 10)];
        happyLabel.text = @"хорошо";
        happyLabel.font = [UIFont systemFontOfSize:10];
        [happyLabel setTextAlignment:NSTextAlignmentCenter];
        [happyLabel setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
        pockerFaceLabel = [[UILabel alloc] initWithFrame:CGRectMake(size.x + 70,size.y + 50, 60, 10)];
        pockerFaceLabel.text = @"неважно";
        pockerFaceLabel.font = [UIFont systemFontOfSize:10];
        [pockerFaceLabel setTextAlignment:NSTextAlignmentCenter];
        [pockerFaceLabel setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
        sadLabel = [[UILabel alloc] initWithFrame:CGRectMake(size.x + 130,size.y + 50, 60, 10)];
        sadLabel.text = @"плохо";
        sadLabel.font = [UIFont systemFontOfSize:10];
        [sadLabel setTextAlignment:NSTextAlignmentCenter];
        [sadLabel setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
        angryLabel = [[UILabel alloc] initWithFrame:CGRectMake(size.x + 190,size.y + 50, 60, 10)];
        angryLabel.text = @"злая";
        angryLabel.font = [UIFont systemFontOfSize:10];
        [angryLabel setTextAlignment:NSTextAlignmentCenter];
        [angryLabel setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
        depressLabel = [[UILabel alloc] initWithFrame:CGRectMake(size.x + 250,size.y + 50, 60, 10)];
        depressLabel.text = @"депрессия";
        depressLabel.font = [UIFont systemFontOfSize:10];
        [depressLabel setTextAlignment:NSTextAlignmentCenter];
        [depressLabel setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
        happySmile = [[UIImageView alloc] initWithFrame:CGRectMake(size.x + 20,size.y + 10, 40, 40)];
        happySmile.image = [UIImage imageNamed:@"happySmile.png"];
        pockerFaceSmile = [[UIImageView alloc] initWithFrame:CGRectMake(size.x + 80,size.y + 10, 40, 40)];
        pockerFaceSmile.image = [UIImage imageNamed:@"pockerFaceSmile.png"];
        sadSmile = [[UIImageView alloc] initWithFrame:CGRectMake(size.x + 140,size.y + 10, 40, 40)];
        sadSmile.image = [UIImage imageNamed:@"sadSmile.png"];
        angrySmile = [[UIImageView alloc] initWithFrame:CGRectMake(size.x + 200,size.y + 10, 40, 40)];
        angrySmile.image = [UIImage imageNamed:@"angrySmile.png"];
        depressSmile = [[UIImageView alloc] initWithFrame:CGRectMake(size.x + 260,size.y+ 10, 40, 40)];
        depressSmile.image = [UIImage imageNamed:@"depressSmile.png"];
        happyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        happyButton.frame = CGRectMake(size.x + 20,size.y + 10, 40, 40);
        pockerFaceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        pockerFaceButton.frame = CGRectMake(size.x + 80,size.y + 10, 40, 40);
        sadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        sadButton.frame = CGRectMake(size.x + 140,size.y + 10, 40, 40);
        angryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        angryButton.frame = CGRectMake(size.x + 200,size.y + 10, 40, 40);
        depressButton = [UIButton buttonWithType:UIButtonTypeCustom];
        depressButton.frame = CGRectMake(size.x + 260,size.y + 10, 40, 40);
        [self.contentView addSubview:myFeeling];
        [self.contentView addSubview:happyButton];
        [self.contentView addSubview:happyLabel];
        [self.contentView addSubview:happySmile];
        [self.contentView addSubview:pockerFaceButton];
        [self.contentView addSubview:pockerFaceLabel];
        [self.contentView addSubview:pockerFaceSmile];
        [self.contentView addSubview:sadButton];
        [self.contentView addSubview:sadLabel];
        [self.contentView addSubview:sadSmile];
        [self.contentView addSubview:angryButton];
        [self.contentView addSubview:angryLabel];
        [self.contentView addSubview:angrySmile];
        [self.contentView addSubview:depressButton];
        [self.contentView addSubview:depressLabel];
        [self.contentView addSubview:depressSmile];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:NO animated:NO];

    // Configure the view for the selected state
}

@end
