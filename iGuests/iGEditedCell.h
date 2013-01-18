//
//  iGEditedCell.h
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iGEditedCell : UITableViewCell <UITextFieldDelegate, UITextInputTraits, UIGestureRecognizerDelegate>{
    UILabel *cellLabel;
    UILabel *cellLabel2;
    UITextField *cellField;
    UIImageView *cellPictogramm;
    UIButton *doneButton;
}

@property (nonatomic) UILabel *cellLabel;
@property (nonatomic) UILabel *cellLabel2;
@property (nonatomic) UITextField *cellField;
@property (nonatomic) UIImageView *cellPictogramm;
@property (nonatomic) UIButton *doneButton;

@end
