//
//  AppRatingViewController.m
//  EatOye
//
//  Created by Owais Akbar on 27/02/2014.
//  Copyright (c) 2014 Owais Akbar. All rights reserved.
//

#import "AppRatingViewController.h"
#import "Appirater.h"


@interface AppRatingViewController ()

@end

@implementation AppRatingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)rateIt:(id)sender
{
    [Appirater setAppId:@"770699556"];
    [Appirater setDaysUntilPrompt:0];
    [Appirater setUsesUntilPrompt:0];
    [Appirater setSignificantEventsUntilPrompt:-1];
    [Appirater setTimeBeforeReminding:0];
    [Appirater setDebug:NO];
    [Appirater appLaunched:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
