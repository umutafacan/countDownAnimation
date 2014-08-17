//
//  MainViewController.m
//  countDownAnimation
//
//  Created by umut on 17/08/14.
//  Copyright (c) 2014 umut. All rights reserved.
//

#import "MainViewController.h"
#import "JDFlipNumberView.h"
#import "JDFlipClockView.h"
#import "JDFlipImageView.h"
#import "JDDateCountdownFlipView.h"
#import "UIView+JDFlipImageView.h"
#import "UIFont+FlipNumberViewExample.h"


@interface MainViewController ()
@property (nonatomic) UIView *flipView;
@property (nonatomic) NSString *imageBundleName;
@property (nonatomic, assign) BOOL useAlternativeImages;

@end

@implementation MainViewController

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
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    } else {
        self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    
    // add info label
    CGRect frame = CGRectInset(self.view.bounds, 10, 10);
    frame.size.height = 20;
    frame.origin.y = self.view.frame.size.height - frame.size.height - 10;
    
    // setup flip number view style
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        self.imageBundleName = self.useAlternativeImages ? nil : @"JDFlipNumberViewIOS6";
    } else {
        self.imageBundleName = self.useAlternativeImages ? @"JDFlipNumberViewIOS6" : nil;
    }
    
    // show flipNumberView
    BOOL addGestureRecognizer = YES;

    
    // add gesture recognizer
    if (addGestureRecognizer) {
        [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                         initWithTarget:self action:@selector(viewTapped:)]];
    }
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAnimation:(id)sender {
    
    JDFlipNumberView *flipView = [[JDFlipNumberView alloc] initWithDigitCount:3 imageBundleName:self.imageBundleName];
    flipView.value = 32;
    flipView.maximumValue = 128;
    flipView.reverseFlippingDisabled = YES;
    [self.view addSubview: flipView];
    self.flipView = flipView;
    
    [flipView animateDownWithTimeInterval:0.3];

}

@end
