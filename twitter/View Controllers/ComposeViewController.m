//
//  ComposeViewController.m
//  twitter
//
//  Created by panzaldo on 7/3/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *tweetButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeButton;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
}

// Action method for the close button
- (IBAction)closeButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


// Invoking the API method using the text in the UITextView 
- (IBAction)tweetButtonTapped:(UIBarButtonItem *)sender {
    [[APIManager shared] postStatusWithText:self.tweetTextView.text completion:^ (Tweet *tweet, NSError *error){
        if(tweet){
            [self.delegate didTweet:tweet];
            NSLog(@"😎😎😎 Success!");
            
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        [self dismissViewControllerAnimated:true completion:nil];
    }];
    
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
