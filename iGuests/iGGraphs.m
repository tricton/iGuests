//
//  iGGraphs.m
//  iGuests
//
//  Created by admin on 10.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGGraphs.h"

@interface iGGraphs ()

@end

@implementation iGGraphs

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *graphPageItem = [self tabBarItem];
        [graphPageItem setTitle:@"Графики"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
