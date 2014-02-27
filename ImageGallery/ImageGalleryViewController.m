//
//  ImageGalleryViewController.m
//  EatOye
//
//  Created by Owais Akbar on 26/02/2014.
//  Copyright (c) 2014 Owais Akbar. All rights reserved.
//

#import "ImageGalleryViewController.h"
#import "AsyncImageView.h"
#import "AppRatingViewController.h"


NSMutableArray *imagelink;
UIView *largeView;
@interface ImageGalleryViewController ()

@end

@implementation ImageGalleryViewController
@synthesize scrl_gallery;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    imagelink = [[NSMutableArray alloc] initWithObjects:@"http://upload.wikimedia.org/wikipedia/en/2/2f/NatKingCole_ThisIsNatKingCole_300.jpg",@"http://www.badhaven.com/wp-content/uploads/2012/01/300px-DC_Comics_logo.svg_.png",@"http://allthingsd.com/files/2011/06/bernie-meyerson-ibm-300px.jpg",@"http://content.animalnewyork.com/wp-content/uploads/pacific-rim-bang-300px.jpg",@"http://susiebright.blogs.com/.a/6a00d8341c5e4053ef016302c4c4e2970d-800wi",@"http://static3.wikia.nocookie.net/__cb20090926144152/channel101/images/2/22/300px-NBC_logo.svg.png",@"http://upload.wikimedia.org/wikipedia/commons/f/fe/Flag_de-saarland_300px.png",@"http://upload.wikimedia.org/wikipedia/en/5/53/Team_america_poster_300px.jpg", nil];
    
    [self loadScroll];
}
-(void)loadScroll
{
    
    int imageY = 5;

    for(int i=0;i<imagelink.count;i++)
    {
        
    
    if(i%2==0)
    {
        AsyncImageView *asyncImage1 = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, imageY, 150, 150)];
        [asyncImage1 setImageURL:[NSURL URLWithString:[imagelink objectAtIndex:i]]];
        
        UIButton *btnClick = [[UIButton alloc] initWithFrame:asyncImage1.frame];
        [btnClick addTarget:self
                   action:@selector(viewLargeImage:)
         forControlEvents:UIControlEventTouchDown];
        btnClick.tag = i;
        
        [scrl_gallery addSubview:btnClick];
        [scrl_gallery addSubview:asyncImage1];
    }
    else
    {
            AsyncImageView *asyncImage1 = [[AsyncImageView alloc] initWithFrame:CGRectMake(160, imageY, 150, 150)];
            [asyncImage1 setImageURL:[NSURL URLWithString:[imagelink objectAtIndex:i]]];
        
        
        UIButton *btnClick = [[UIButton alloc] initWithFrame:asyncImage1.frame];
        [btnClick addTarget:self
                     action:@selector(viewLargeImage:)
           forControlEvents:UIControlEventTouchDown];
        btnClick.tag = i;
        
        [scrl_gallery addSubview:btnClick];
        [scrl_gallery addSubview:asyncImage1];

    }
    
    if (i%2)
    {
        imageY = imageY + 155;
    }
   
    
    
    
    }
    
    int contentHeight = imagelink.count/2;
    if (imagelink.count%2)
    {
        contentHeight =  160 * contentHeight + 150;
    }
    else
    {
        contentHeight =  160 * contentHeight;

    }
    
    
    [scrl_gallery setContentSize:CGSizeMake(320,contentHeight)];
    
}
-(void)removeLarge
{
    [largeView removeFromSuperview];
    
}
-(IBAction)viewLargeImage:(id)sender
{
 
    AsyncImageView *imglarge = [[AsyncImageView alloc] initWithFrame:CGRectMake(7, 100, 305, 450)];
    [imglarge setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[imagelink objectAtIndex:[sender tag]]]]];
    
    UIButton *btnClose = [[UIButton alloc] initWithFrame:CGRectMake(290, 70, 30,30)];
    [btnClose addTarget:self
                 action:@selector(removeLarge)
       forControlEvents:UIControlEventTouchDown];
    [btnClose setBackgroundImage:[UIImage imageNamed:@"close.png"]
                        forState:UIControlStateNormal];
    
    largeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    largeView.backgroundColor = [UIColor lightGrayColor];
    
    
    
    
    [largeView addSubview:imglarge];
    [largeView addSubview:btnClose];
    
    [self.view addSubview:largeView];

    
}
-(IBAction)gotoAppRating:(id)sender
{
    AppRatingViewController *test = [[AppRatingViewController alloc] initWithNibName:@"AppRatingViewController" bundle:nil];
    [self.navigationController pushViewController:test animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
