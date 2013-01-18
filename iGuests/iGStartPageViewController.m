//
//  iGStartPageViewController.m
//  iGuests
//
//  Created by admin on 10.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGStartPageViewController.h"

@interface iGStartPageViewController ()

@end

@implementation iGStartPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *calendarPageItem = [self tabBarItem];
        [calendarPageItem setTitle:@"Календарь"];
    }
    return self;
}

-(void) loadView{
    CGRect mainFrame = [[UIScreen mainScreen] bounds];
//    iGDayTile *dayTile = [[iGDayTile alloc] initWithFrame:calendarTile];
    UIView *calendarTile = [[UIView alloc] initWithFrame:mainFrame];
    [calendarTile setBackgroundColor:[UIColor colorWithRed:0.4745 green:0.8235 blue:0.9725 alpha:1]];
    [self setView:calendarTile];
    dayButtons = [NSMutableArray array];
    dayLabels = [NSMutableArray array];
    dayRects = [NSMutableArray array];
    int buttonNumber = 0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        UIImage *day1 = [UIImage imageNamed:@"day1.png"];
        UIImage *day2 = [UIImage imageNamed:@"day2.png"];
        UIImage *day3 = [UIImage imageNamed:@"day3.png"];
        UIImage *day4 = [UIImage imageNamed:@"day4.png"];
        UIImage *day5 = [UIImage imageNamed:@"day5.png"];
        UIImage *day6 = [UIImage imageNamed:@"day6.png"];
        UIImage *day7 = [UIImage imageNamed:@"day7.png"];
        NSArray *dayImages = [NSArray arrayWithObjects:day1,day2,day3,day4,day5,day6,day7, nil];
        for (int j = 50; j < 315; j += 45){
            for (int i = 4; i < 300; i += 45){
                int d = arc4random() % 7;
                UIImage *buttonImage = [dayImages objectAtIndex:d];
                CGRect buttonRect = CGRectMake(i, j, 42, 42);
                UIButton *button = [self createButtonsInRect:buttonRect];
                [button setImage:buttonImage
                        forState:UIControlStateNormal];
                [dayButtons insertObject:button
                                 atIndex:buttonNumber];
                button.tag = ++buttonNumber+100;
            }
        }
        buttonNumber = 0;
        for (int j = 81; j < 315; j += 45){
            for (int i = 35; i < 320; i += 45){
                CGRect labelRect = CGRectMake(i, j, 10, 10);
                UILabel *label = [self createLabelInRect:labelRect];
                [dayLabels insertObject:label
                                atIndex:buttonNumber];
                label.tag = ++buttonNumber+200;
            }
        }
        UIButton *lessMonth = [UIButton buttonWithType:UIButtonTypeCustom];
        lessMonth.frame = CGRectMake(15, 10, 60, 40);
        [lessMonth setImage:[UIImage imageNamed:@"prev.png"]
                   forState:UIControlStateNormal];
        [lessMonth addTarget:self
                      action:@selector(showPreviousMonth)
            forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:lessMonth];
        UIButton *grateMonth = [UIButton buttonWithType:UIButtonTypeCustom];
        grateMonth.frame = CGRectMake(245, 10, 60, 40);
        [grateMonth setImage:[UIImage imageNamed:@"next.png"]
                    forState:UIControlStateNormal];
        [grateMonth addTarget:self
                      action:@selector(showNextMonth)
            forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:grateMonth];
        topDate = [[UILabel alloc] initWithFrame:CGRectMake(75, 10, 170, 40)];
        [topDate setBackgroundColor:[UIColor clearColor]];
        [topDate setFont:[UIFont boldSystemFontOfSize:20]];
        //[topDate setTextColor:[UIColor whiteColor]];
        [topDate setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:topDate];
    }else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        for (int j = 150; j < 780; j += 107){
            for (int i = 13; i < 700; i += 107){
                CGRect buttonRect = CGRectMake(i, j, 70, 70);
                UIButton *button = [self createButtonsInRect:buttonRect];
                [dayButtons insertObject:button
                                 atIndex:buttonNumber];
                button.tag = ++buttonNumber;
            }
        }
        buttonNumber = 0;
        dayLabels = [NSMutableArray array];
        for (int j = 230; j < 780; j += 107){
            for (int i = 93; i < 750; i += 107){
                CGRect labelRect = CGRectMake(i, j, 20, 20);
                UILabel *label = [self createLabelInRect:labelRect];
                [dayLabels insertObject:label
                                atIndex:buttonNumber];
                label.tag = ++buttonNumber+200;
            }
        }
        UIButton *lessMonth = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        lessMonth.frame = CGRectMake(50, 25, 100, 100);
        [lessMonth addTarget:self
                      action:@selector(showPreviousMonth)
            forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:lessMonth];
        UIButton *grateMonth = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        grateMonth.frame = CGRectMake(618, 25, 100, 100);
        [grateMonth addTarget:self
                       action:@selector(showNextMonth)
             forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:grateMonth];
        topDate = [[UILabel alloc] initWithFrame:CGRectMake(160, 25, 448, 100)];
        [topDate setBackgroundColor:[UIColor clearColor]];
        [topDate setFont:[UIFont boldSystemFontOfSize:20]];
       // [topDate setTextColor:[UIColor whiteColor]];
        [topDate setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:topDate];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	mainCalendar = [NSCalendar currentCalendar];
    [mainCalendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *today = [NSDate date];
    currentShowingDate = today;
    [self createDatesForVisibleCalendarWithPresentData:today];
    UISwipeGestureRecognizer *swipeToLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(showNextMonth)];
    [swipeToLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeToLeft];
    UISwipeGestureRecognizer *swipeToRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(showPreviousMonth)];
    [swipeToRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeToRight];
    
}

//Отсчёт помесячно вперёд
-(NSDate *) decreaseChangeMonthWithDate:(NSDate *) date{
    NSDateComponents *tempComponents = [mainCalendar components:NSMonthCalendarUnit | NSYearCalendarUnit
                                                       fromDate:date];
    NSUInteger numberOfMonthInYear = [tempComponents month];
    NSUInteger numberOfYear = [tempComponents year];
    if (numberOfMonthInYear == 1){
        [tempComponents setMonth:12];
        [tempComponents setYear:numberOfYear - 1];
    }else{
        [tempComponents setMonth:numberOfMonthInYear - 1];
    }
    NSDate *dateWithLessNumberOfMonth = [mainCalendar dateFromComponents:tempComponents];
    return dateWithLessNumberOfMonth;
}

//Отсчёт помесячно назад
-(NSDate *) increaseChangeMonthWithDate:(NSDate *) date{
    NSDateComponents *tempComponents = [mainCalendar components:NSMonthCalendarUnit | NSYearCalendarUnit
                                                       fromDate:date];
    NSUInteger numberOfMonthInYear = [tempComponents month];
    NSUInteger numberOfYear = [tempComponents year];
    if (numberOfMonthInYear == 12){
        [tempComponents setMonth:1];
        [tempComponents setYear:numberOfYear + 1];
    }else{
        [tempComponents setMonth:numberOfMonthInYear + 1];
    }
    NSDate *dateWithGraterNumberOfMonth = [mainCalendar dateFromComponents:tempComponents];
    return dateWithGraterNumberOfMonth;
}

//Создание кнопок для выбора даты
-(UIButton *) createButtonsInRect:(CGRect) rect{
    UIButton *dayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dayButton.frame = rect;
    [dayButton addTarget:self
                  action:@selector(print:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dayButton];
    return dayButton;
}

//Создание меток для отображения даты
-(UILabel *) createLabelInRect:(CGRect) rect{
    UILabel *dayLabel = [[UILabel alloc] init];
    dayLabel.frame = rect;
    [dayLabel setTextAlignment:NSTextAlignmentCenter];
    [dayLabel setFont:[UIFont systemFontOfSize:8]];
    [dayLabel setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:dayLabel];
    return dayLabel;
}

//Обработка нажатия на дни календаря
-(NSUInteger) print:(UIButton *)sender{
    unsigned short buttonPressed = sender.tag - 100;
    unsigned short weekDay = [self weekDayFromDate:currentShowingDate];
    unsigned short daysInCurrentMonth = [mainCalendar rangeOfUnit:NSDayCalendarUnit
                                                       inUnit:NSMonthCalendarUnit
                                                      forDate:currentShowingDate].length;
    unsigned short numberOfMaxDay = (weekDay + daysInCurrentMonth - 1);
    NSDateComponents *compsToCalculateSelectedDate = [mainCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
                                                                     fromDate:currentShowingDate];
    [compsToCalculateSelectedDate setDay:(buttonPressed - (weekDay - 1))];
    NSDate *selectedDate = [mainCalendar dateFromComponents:compsToCalculateSelectedDate];
    if (buttonPressed >= weekDay && buttonPressed <= numberOfMaxDay){
        NSLog(@"%@", selectedDate);
    }else if (buttonPressed < weekDay){
        [self showPreviousMonth];
        NSLog(@"%@", selectedDate);
    }else if (buttonPressed > numberOfMaxDay){
        [self showNextMonth];
        NSLog(@"%@", selectedDate);
    }
    return buttonPressed;
}

//Заполнение календаря датами
-(void) createDatesForVisibleCalendarWithPresentData:(NSDate *) date{
    NSInteger currentDaysInMonthCount = [mainCalendar rangeOfUnit:NSDayCalendarUnit
                                                           inUnit:NSMonthCalendarUnit
                                                          forDate:date].length;
    NSDate *previousDate = [self decreaseChangeMonthWithDate:date];
    NSInteger previousDaysInMonthCount = [mainCalendar rangeOfUnit:NSDayCalendarUnit
                                                            inUnit:NSMonthCalendarUnit
                                                           forDate:previousDate].length;
    NSUInteger weekDay = [self weekDayFromDate:date];
    for (int i = 1; i < weekDay; i++){
        UILabel *label = [dayLabels objectAtIndex:(i - 1)];
        label.text = [NSString stringWithFormat:@"%i", previousDaysInMonthCount - (weekDay - (i + 1))];
        [dayLabels removeObjectAtIndex:(i - 1)];
        [dayLabels insertObject:label
                        atIndex:(i - 1)];
    }
    for (int i = weekDay; i <= (currentDaysInMonthCount + weekDay); i++){
        UILabel *label = [dayLabels objectAtIndex:(i - 1)];
        label.text = [NSString stringWithFormat:@"%i", i - weekDay + 1];
        [dayLabels removeObjectAtIndex:(i - 1)];
        [dayLabels insertObject:label
                        atIndex:(i - 1)];
    }
    for (int i = (currentDaysInMonthCount + weekDay); i <= 42; i++){
        UILabel *label = [dayLabels objectAtIndex:(i - 1)];
        label.text = [NSString stringWithFormat:@"%i", i - (currentDaysInMonthCount + weekDay) + 1];
        [dayLabels removeObjectAtIndex:(i - 1)];
        [dayLabels insertObject:label
                        atIndex:(i - 1)];
    }
    currentShowingDate = date;
    [self viewDateInTop];
}

//Переход на предыдущий месяц
-(void) showPreviousMonth{
    NSDate *previousDate = [self decreaseChangeMonthWithDate:currentShowingDate];
    [self createDatesForVisibleCalendarWithPresentData:previousDate];
}

//Переход на следующий месяц
-(void) showNextMonth{
    NSDate *nextDate = [self increaseChangeMonthWithDate:currentShowingDate];
    [self createDatesForVisibleCalendarWithPresentData:nextDate];
}

//Вывод текущего месяца и года над календарём
-(void) viewDateInTop{
    NSDateComponents *compToShowDate = [mainCalendar components:NSMonthCalendarUnit | NSYearCalendarUnit
                                                       fromDate:currentShowingDate];
    NSUInteger visibleMonth = [compToShowDate month];
    NSUInteger visibleYear = [compToShowDate year];
    NSString *month = [NSString string];
    switch (visibleMonth) {
        case 1:
            month = @"Январь";
            break;
        case 2:
            month = @"Февраль";
            break;
        case 3:
            month = @"Март";
            break;
        case 4:
            month = @"Апрель";
            break;
        case 5:
            month = @"Май";
            break;
        case 6:
            month = @"Июнь";
            break;
        case 7:
            month = @"Июль";
            break;
        case 8:
            month = @"Август";
            break;
        case 9:
            month = @"Сентябрь";
            break;
        case 10:
            month = @"Октябрь";
            break;
        case 11:
            month = @"Ноябрь";
            break;
        case 12:
            month = @"Декабрь";
            break;
        default:
            break;
    }
    NSString *currentTopDate = [NSString stringWithFormat:@"%@ %i", month, visibleYear];
    [topDate setText:currentTopDate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Рассчёт первого дня недели для месяца 
-(NSUInteger) weekDayFromDate:(NSDate *) date{
    NSDateComponents *compToCalcWeekDay = [mainCalendar components:NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit
                                                          fromDate:date];
    [compToCalcWeekDay setDay:1];
    NSDate *tempDate = [mainCalendar dateFromComponents:compToCalcWeekDay];
    compToCalcWeekDay = [mainCalendar components:NSWeekdayCalendarUnit
                                        fromDate:tempDate];
    NSUInteger weekDay = [compToCalcWeekDay weekday];
    if (weekDay > 1){
        return (weekDay - 1);
    }else{
        return 7;
    }
}

@end
