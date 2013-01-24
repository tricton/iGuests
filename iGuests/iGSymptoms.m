//
//  iGSymptoms.m
//  iGuests
//
//  Created by admin on 16.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGSymptoms.h"
//#import "MainBase.h"

@interface iGSymptoms ()

@end

@implementation iGSymptoms

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setView:view];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        CGRect tableFrame = self.view.bounds;
        UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 40)];
        topLabel.text = @"               Симптомы";
        [topLabel setTextAlignment:NSTextAlignmentCenter];
        topLabel.font = [UIFont systemFontOfSize:20];
        [topLabel setBackgroundColor:[UIColor colorWithWhite:0.1
                                                       alpha:0.5]];
        [self.view addSubview:topLabel];
        
        UIButton *returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        returnButton.frame = CGRectMake(0, 10, 80, 40);
        [returnButton setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
        [returnButton addTarget:self
                         action:@selector(back)
               forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:returnButton];
        
        symptomsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableFrame.origin.y + 50, 320, tableFrame.size.height - 70)
                                                         style:UITableViewStylePlain];
        [self.view addSubview:symptomsTableView];
        [symptomsTableView setDelegate:self];
        [symptomsTableView setDataSource:self];
        [symptomsTableView setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];

        symptoms = [NSArray arrayWithObjects:@"Боли в пояснице",@"Головные боли",@"Боли в животе",@"Боли в груди",@"Головокружение",@"Давление повышено",@"Давление понижено",@"Аппетит",@"Запор",@"Расстройство желудка",@"Тянет на сладкое",@"Тянет на солёное",@"Тянет на кислое",@"Вздутие живота",@"Угревая сыпь",@"Увеличение груди",@"Отёки", nil];
    }
}

-(void) back{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

-(BOOL)       tableView:(UITableView *)tableView
shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [symptoms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    iGSymptomsCell *cell = (iGSymptomsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [[iGSymptomsCell alloc] init];
    }
    cell.textLabel.text = [symptoms objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
