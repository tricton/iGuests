//
//  iGEditDay.m
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGEditDay.h"

@interface iGEditDay ()

@end

@implementation iGEditDay

#pragma Methods of System

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *editPageItem = [self tabBarItem];
        [editPageItem setTitle:@"Редактировать"];
    }
    return self;
}

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    switch (indexPath.row){
        case 0:
            if (!smileCell){
                smileCell = [[iGSmileCell alloc] init];
                cell = smileCell;
                smileCell = nil;
            }
            break;
        case 1:
            if (!editedCell){
                editedCell = [[iGEditedCell alloc] init];
                editedCell.cellLabel.text = @"  Мой вес сегодня";
                editedCell.cellLabel2.text = @"кг";
                editedCell.cellPictogramm.image = [UIImage imageNamed:@"libra.png"];
                cell = editedCell;
                editedCell = nil;
            }
            break;
        case 2:
            if (!editedCell){
                editedCell = [[iGEditedCell alloc] init];
                editedCell.cellLabel.text = @"  У меня сегодня температура";
                editedCell.cellLabel2.text = @"∘C";
                editedCell.cellPictogramm.image = [UIImage imageNamed:@"termometr.png"];
                cell = editedCell;
                editedCell = nil;
            }
            break;
        case 3:
            if (!switchedCell){
                switchedCell = [[iGSwitchedCell alloc] init];
                switchedCell.cellLabel.text = @"  У меня сегодня секс";
                switchedCell.cellPictogramm.image = [UIImage imageNamed:@"sex.png"];
                cell = switchedCell;
                switchedCell = nil;
            }
            break;
        case 4:
            if (!switchedCell){
                switchedCell = [[iGSwitchedCell alloc] init];
                switchedCell.cellLabel.text = @"  Я сегодня таблетки";
                switchedCell.cellPictogramm.image = [UIImage imageNamed:@"tablet.png"];
                cell = switchedCell;
                switchedCell = nil;
            }
            break;
        case 5:
            if (!switchedCell){
                switchedCell = [[iGSwitchedCell alloc] init];
                switchedCell.cellLabel.text = @"  Я сегодня спортом";
                switchedCell.cellPictogramm.image = [UIImage imageNamed:@"sport.png"];
                cell = switchedCell;
                switchedCell = nil;
            }
            break;
        case 6:
            if (!switchedCell){
                switchedCell = [[iGSwitchedCell alloc] init];
                switchedCell.cellLabel.text = @"  У меня сегодня овуляция";
                switchedCell.cellPictogramm.image = [UIImage imageNamed:@"ovulationSmile.png"];
                cell = switchedCell;
                switchedCell = nil;
            }
            break;
        case 7:
            if (!switchedCell){
                switchedCell = [[iGSwitchedCell alloc] init];
                switchedCell.cellLabel.text = @"  Сегодня началась менструация";
                switchedCell.cellPictogramm.image = [UIImage imageNamed:@"blood.png"];
                cell = switchedCell;
                switchedCell = nil;                
            }
            break;
        case 8:
            if (!discloseCell){
                discloseCell = [[iGDisclosureCell alloc] init];
                discloseCell.cellLabel.text = @"  Мои сегодняшние симптомы";
                discloseCell.cellPictogramm.image = [UIImage imageNamed:@"symptoms.png"];
                cell = discloseCell;
                discloseCell = nil;
            }
            break;
        case 9:
            if (!noteCell){
                noteCell = [[iGNoteCell alloc] init];
                cell = noteCell;
                noteCell = nil;
            }
            break;
        default:
            break;
    }
    return cell;
}


-(NSInteger) tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (CGFloat)     tableView:(UITableView *)tableView
  heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    float i;
    if (indexPath.row == 0){
        i = 60;
    }else if (indexPath.row == 9){
        i = 120;
    }else{
        i = 44;
    }
    return i;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect myScreen = [[UIScreen mainScreen] bounds];
    UIView *view = [[UIView alloc] initWithFrame:myScreen];
    [self setView:view];
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 30)];
    topLabel.text = @"Режим редактирования дня";
    [topLabel setFont:[UIFont systemFontOfSize:20]];
    [topLabel setTextAlignment:NSTextAlignmentCenter];
    [topLabel setBackgroundColor:[UIColor colorWithWhite:0.1
                                                   alpha:0.5]];
    [self.view addSubview:topLabel];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        UITapGestureRecognizer *hideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(hideKeyboard)];
        [hideKeyboard setNumberOfTapsRequired:1];
        [hideKeyboard setDelegate:self];
        [self.view addGestureRecognizer:hideKeyboard];
        CGRect tableFrame = self.view.bounds;
        editTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableFrame.origin.x + 40, 320, tableFrame.size.height - 110)
                                                     style:UITableViewStylePlain];
        [self.view addSubview:editTableView];
        [editTableView setDelegate:self];
        [editTableView setDataSource:self];
        [editTableView setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
    }
}


- (BOOL)            tableView:(UITableView *)tableView
shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 8){
        [self symptoms];
        return YES;
    }
    else
        return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma My Methods

-(void) hideKeyboard{
    [self.view endEditing:YES];
}

-(void) symptoms{
    iGSymptoms *symptoms = [[iGSymptoms alloc] init];
    [self presentViewController:symptoms
                       animated:YES
                     completion:nil];
}

@end
