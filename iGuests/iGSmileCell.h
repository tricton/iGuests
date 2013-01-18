//
//  iGSmileCell.h
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iGSmileCell : UITableViewCell{
    UIImageView *happySmile;
    UIImageView *pockerFaceSmile;
    UIImageView *sadSmile;
    UIImageView *angrySmile;
    UIImageView *depressSmile;
    UILabel *happyLabel;
    UILabel *pockerFaceLabel;
    UILabel *sadLabel;
    UILabel *angryLabel;
    UILabel *depressLabel;
    UILabel *myFeeling;
    UIButton *happyButton;
    UIButton *pockerFaceButton;
    UIButton *sadButton;
    UIButton *angryButton;
    UIButton *depressButton;
}

@property (nonatomic) UIButton *happyButton;
@property (nonatomic) UIButton *pockerFaceButton;
@property (nonatomic) UIButton *sadButton;
@property (nonatomic) UIButton *angryButton;
@property (nonatomic) UIButton *depressButton;

@end
