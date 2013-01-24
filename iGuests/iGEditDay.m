//
//  iGEditDay.m
//  iGuests
//
//  Created by admin on 15.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGEditDay.h"
#import "iGStartPageViewController.h"
#import "iGSelectedDate.h"
#import "iGAppDelegate.h"
//#import "MainBase.h"

@interface iGEditDay ()

@end

@implementation iGEditDay

#pragma Methods of System

//Инициализация, вывод надписи в ТабБар
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *editPageItem = [self tabBarItem];
        [editPageItem setTitle:@"Редактировать"];
    }
    return self;
}

//Заполнение ячеек
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
                weightField = editedCell.cellField;
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
                weightField = editedCell.cellField;
                cell = editedCell;
                editedCell = nil;
            }
            break;
        case 3:
            if (!switchedCell){
                switchedCell = [[iGSwitchedCell alloc] init];
                switchedCell.cellLabel.text = @"  У меня сегодня секс";
                switchedCell.cellPictogramm.image = [UIImage imageNamed:@"sex.png"];
                [switchedCell.cellSwitch setOnImage:[UIImage imageNamed:@"beSex"]];
                [switchedCell.cellSwitch setOffImage:[UIImage imageNamed:@"noSex"]];
                isSex = switchedCell.cellSwitch;
                cell = switchedCell;
                switchedCell = nil;
            }
            break;
        case 4:
            if (!switchedCell){
                switchedCell = [[iGSwitchedCell alloc] init];
                switchedCell.cellLabel.text = @"  Я сегодня таблетки";
                switchedCell.cellPictogramm.image = [UIImage imageNamed:@"tablet.png"];
                isTablets = switchedCell.cellSwitch;
                cell = switchedCell;
                switchedCell = nil;
            }
            break;
        case 5:
            if (!switchedCell){
                switchedCell = [[iGSwitchedCell alloc] init];
                switchedCell.cellLabel.text = @"  Я сегодня спортом";
                switchedCell.cellPictogramm.image = [UIImage imageNamed:@"sport.png"];
                isSport = switchedCell.cellSwitch;
                cell = switchedCell;
                switchedCell = nil;
            }
            break;
        case 6:
            if (!switchedCell){
                switchedCell = [[iGSwitchedCell alloc] init];
                switchedCell.cellLabel.text = @"  У меня сегодня овуляция";
                switchedCell.cellPictogramm.image = [UIImage imageNamed:@"ovulationSmile.png"];
                isOvulation = switchedCell.cellSwitch;
                cell = switchedCell;
                switchedCell = nil;
            }
            break;
        case 7:
            if (!switchedCell){
                switchedCell = [[iGSwitchedCell alloc] init];
                switchedCell.cellLabel.text = @"  Сегодня началась менструация";
                switchedCell.cellPictogramm.image = [UIImage imageNamed:@"blood.png"];
                isMenstruation = switchedCell.cellSwitch;
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

//Количество строк в таблице
-(NSInteger) tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return 10;
}

//Корректировка высоты нужных ячеек
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

//Действия при отображении въюКонтроллера
-(void) viewDidAppear:(BOOL)animated{
    
}

//Выводим элементы интерфейса
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![iGSelectedDate sharedDate].selectedDate){
        [iGSelectedDate sharedDate].selectedDate = [NSDate date];
    }
    CGRect myScreen = [[UIScreen mainScreen] bounds];
    UIView *view = [[UIView alloc] initWithFrame:myScreen];
    [self setView:view];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        UIButton *standartFillingsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        standartFillingsButton.frame = CGRectMake(10, 42, 300, 36);
        [standartFillingsButton setTitle:@"Всё как вчера"
                                forState:UIControlStateNormal];
        [standartFillingsButton addTarget:self
                                   action:@selector(loadYesterdayDefaults)
                         forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:standartFillingsButton];
        topLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 240, 30)];
        [topLabel setText:[self getHeaderText]];
        [topLabel setFont:[UIFont systemFontOfSize:16]];
        [topLabel setTextAlignment:NSTextAlignmentCenter];
        [topLabel setBackgroundColor:[UIColor colorWithWhite:0.1
                                                       alpha:0.5]];
        [self.view addSubview:topLabel];
        UIButton *nextDayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [nextDayButton setImage:[UIImage imageNamed:@"nextDay"]
                       forState:UIControlStateNormal];
        [nextDayButton addTarget:self
                          action:@selector(gotoNextDay)
                forControlEvents:UIControlEventTouchUpInside];
        nextDayButton.frame = CGRectMake(280, 11, 40, 29);
        [self.view addSubview:nextDayButton];
        UIButton *prevDayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [prevDayButton setImage:[UIImage imageNamed:@"prevDay"]
                       forState:UIControlStateNormal];
        [prevDayButton addTarget:self
                          action:@selector(gotoPrevDay)
                forControlEvents:UIControlEventTouchUpInside];
        prevDayButton.frame = CGRectMake(0, 11, 40, 29);
        [self.view addSubview:prevDayButton];
        UITapGestureRecognizer *hideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(hideKeyboard)];
        [hideKeyboard setNumberOfTapsRequired:1];
        [hideKeyboard setDelegate:self];
        [self.view addGestureRecognizer:hideKeyboard];
        CGRect tableFrame = self.view.bounds;
        editTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableFrame.origin.x + 80, 320, tableFrame.size.height - 150)
                                                     style:UITableViewStylePlain];
        [self.view addSubview:editTableView];
        [editTableView setDelegate:self];
        [editTableView setDataSource:self];
        [editTableView setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];
    }
}

//Определяем какую ячейку нужно подсветить при нажатии
- (BOOL)            tableView:(UITableView *)tableView
shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 8){
        [self symptoms];
        return YES;
    }else{
        return NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma My Methods

//Прячу клавиатуру по тапу на экран
-(void) hideKeyboard{
    [self.view endEditing:YES];
}

//Вызываю въюКонтроллер с симптомами
-(void) symptoms{
    iGSymptoms *symptoms = [[iGSymptoms alloc] init];
    [self presentViewController:symptoms
                       animated:YES
                     completion:nil];
}

//Вставляем текущую дату в шапку
-(NSString *) getHeaderText{
    NSDateComponents *headerDateComps = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit
                                                                        fromDate:[iGSelectedDate sharedDate].selectedDate];
    short dayDate = [headerDateComps day];
    short monthDate = [headerDateComps month];
    int yearDate = [headerDateComps year];
    NSString *monthString;
    switch (monthDate) {
        case 1:
            monthString = @"января";
            break;
        case 2:
            monthString = @"февраля";
            break;
        case 3:
            monthString = @"марта";
            break;
        case 4:
            monthString = @"апреля";
            break;
        case 5:
            monthString = @"мая";
            break;
        case 6:
            monthString = @"июня";
            break;
        case 7:
            monthString = @"июля";
            break;
        case 8:
            monthString = @"августа";
            break;
        case 9:
            monthString = @"сентября";
            break;
        case 10:
            monthString = @"октября";
            break;
        case 11:
            monthString = @"ноября";
            break;
        case 12:
            monthString = @"декабря";
            break;
        default:
            break;
    }
    NSString *headerText = [NSString stringWithFormat:@"Редактирование %i %@ %i года",dayDate, monthString, yearDate];
    return headerText;
}


-(void) loadYesterdayDefaults{
    
}

//Меняем надпись в шапке на предыдущую дату и меняем значение синглтона
-(void) gotoNextDay{
    NSDateComponents *compToPlusDay = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit
                                                                      fromDate:[iGSelectedDate sharedDate].selectedDate];
    short dayCount = [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit
                                                        inUnit:NSMonthCalendarUnit
                                                       forDate:[iGSelectedDate sharedDate].selectedDate].length;
    short day = [compToPlusDay day];
    short month = [compToPlusDay month];
    int year = [compToPlusDay year];
    if (day == dayCount && month == 12){
        [compToPlusDay setDay:1];
        [compToPlusDay setMonth:1];
        [compToPlusDay setYear:year + 1];
    }else if (day == dayCount && month < 12){
        [compToPlusDay setDay:1];
        [compToPlusDay setMonth:++month];
    }else{
        [compToPlusDay setDay:++day];
    }
    [iGSelectedDate sharedDate].selectedDate = [[NSCalendar currentCalendar] dateFromComponents:compToPlusDay];
    dateInTimeInterval = [[iGSelectedDate sharedDate].selectedDate timeIntervalSinceReferenceDate];
    [topLabel setText:[self getHeaderText]];
    NSLog(@"%@",[iGSelectedDate sharedDate].selectedDate);
}

//Меняем надпись в шапке на предыдущую дату и меняем значение синглтона
-(void) gotoPrevDay{
    NSDateComponents *compToPlusDay = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit
                                                                      fromDate:[iGSelectedDate sharedDate].selectedDate];
    short dayCount = [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit
                                                        inUnit:NSMonthCalendarUnit
                                                       forDate:[iGSelectedDate sharedDate].selectedDate].length;
    short day = [compToPlusDay day];
    short lessDay;
    short month = [compToPlusDay month];
    short lessMonth;
    int year = [compToPlusDay year];
    int lessYear;
    if (month == 1){
        lessMonth = 12;
        lessDay = 2;
        lessYear = year - 1;
    }else{
        lessMonth = month - 1;
        lessDay = 1;
        lessYear = year;
    }
    [compToPlusDay setMonth:lessMonth];
    [compToPlusDay setDay:lessDay];
    [compToPlusDay setYear:lessYear];
    NSDate *lessDate = [[NSCalendar currentCalendar] dateFromComponents:compToPlusDay];
    short lessDayCount = [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit
                                                            inUnit:NSMonthCalendarUnit
                                                           forDate:lessDate].length;
    if (day == 1 && month == 1){
        [compToPlusDay setDay:dayCount];
        [compToPlusDay setMonth:12];
        [compToPlusDay setYear:year - 1];
    }else if (day == 1 && month > 1){
        [compToPlusDay setDay:lessDayCount];
        [compToPlusDay setMonth:--month];
        [compToPlusDay setYear:year];
    }else{
        [compToPlusDay setDay:--day];
        [compToPlusDay setMonth:month];
        [compToPlusDay setYear:year];
    }
    [iGSelectedDate sharedDate].selectedDate = [[NSCalendar currentCalendar] dateFromComponents:compToPlusDay];
    dateInTimeInterval = [[iGSelectedDate sharedDate].selectedDate timeIntervalSinceReferenceDate];
    [topLabel setText:[self getHeaderText]];
    NSLog(@"%@",[iGSelectedDate sharedDate].selectedDate);
}

@end
