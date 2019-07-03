//
//  ComposeViewController.m
//  twitter
//
//  Created by panzaldo on 7/3/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *tweetButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeButton;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// Action method for the close button
- (IBAction)closeButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
