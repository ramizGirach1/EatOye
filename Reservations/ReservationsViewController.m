//
//  ReservationsViewController.m
//  EatOye
//
//  Created by Owais Akbar on 26/02/2014.
//  Copyright (c) 2014 Owais Akbar. All rights reserved.
//

#import "ReservationsViewController.h"
#import "ImageGalleryViewController.h"

@interface ReservationsViewController ()

@end

NSMutableArray *foodItems;
NSMutableArray *foodDescription;
NSMutableArray *addOns;
NSMutableArray *addOnsPrices;

int rowNumber = -1;
BOOL hitOn = FALSE;

@implementation ReservationsViewController
@synthesize tbl_reservation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)gotoGallery:(id)sender
{
    ImageGalleryViewController *test = [[ImageGalleryViewController alloc] initWithNibName:@"ImageGalleryViewController" bundle:nil];
    [self.navigationController pushViewController:test animated:YES];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return foodItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];

//    if (cell == nil) {
    
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }

    UILabel *itemName = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 250, 25)];
    [itemName setText:[foodItems objectAtIndex:indexPath.row]];
    
    UILabel *itemDesc = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 250, 25)];
    [itemDesc setText:[foodDescription objectAtIndex:indexPath.row]];
    itemDesc.textColor = [UIColor darkGrayColor];
    itemDesc.numberOfLines = 0;
    [itemDesc sizeToFit];
    
    int addonHeight = 130;
    UILabel *addOnsName;
    UILabel *addOnsPrice;
    for(int i=0;i<addOns.count;i++)
    {
        

        addOnsName = [[UILabel alloc] initWithFrame:CGRectMake(10,addonHeight, 250, 25)];
        [addOnsName setText:[addOns objectAtIndex:i]];
        addOnsName.textColor = [UIColor redColor];
        
        
        addOnsPrice = [[UILabel alloc] initWithFrame:CGRectMake(240,addonHeight, 250, 25)];
        [addOnsPrice setText:[addOnsPrices objectAtIndex:i]];
        addOnsPrice.textColor = [UIColor redColor];
    
        addonHeight = addonHeight + addOnsName.frame.size.height+10;

        
        [cell addSubview:addOnsName];
        [cell addSubview:addOnsPrice];

    
    }
    
    [cell addSubview:itemDesc];
    [cell addSubview:itemName];
    
    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(hitOn)
    {
        hitOn = FALSE;
    }
    else
    {
        hitOn = TRUE;
    }
    
    rowNumber = indexPath.row;
    [tbl_reservation reloadData];


}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    int rowHeight = 50;
    
    if(hitOn)
    {
        if(indexPath.row==rowNumber)
        {
            rowHeight = 300;
        }
        
    }
 
    return rowHeight;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    foodItems = [[NSMutableArray alloc] initWithObjects:@"Achaar Chicken",@"Chicken Karahi",@"Chicken White Masala",@"Corn Soup",@"Chicken Hot & Sour Soup",@"African Tikka",@"Beef Behari Boti",@"Beef Seekh Kabab",@"Boneless Tikka Chicken", nil];
    
    foodDescription = [[NSMutableArray alloc] initWithObjects:@"8 pieces of Boneless Chicken cooked in achari masala",@"8 pieces of Boneless Chicken cooked in karahi masala",@"8 pieces of Boneless Chicken cooked in white non spicy masala",@"1 bowl of chicken & corn in traditional sauces",@"1 Bowl of chicken & vegetables in hot & sour sauce",@"Chicken breast & leg combined prepared in white non spicy masala served with imli chutney",@"Pieces of marinated meat cooked along with spices",@"Prepared with minced meat along with spices",@"Pieces of chicken breast grilled along with spices", nil];
    
    addOns = [[NSMutableArray alloc] initWithObjects:@"Small plate",@"Medium Plate",@"Regular Plate",@"Full Plate",@"Supremen Plate", nil];
    
    addOnsPrices = [[NSMutableArray alloc] initWithObjects:@"150",@"250",@"350",@"500",@"700", nil];


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
