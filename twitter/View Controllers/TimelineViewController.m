//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "Tweet.h"
#import "User.h"


@interface TimelineViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *tweets;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self fetchTimeline];

    //Allocate the UIRefreshControl
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    //Bind the action to the refresh control
    [self.refreshControl addTarget:self action:@selector(fetchTimeline) forControlEvents:UIControlEventValueChanged];

    //Insert the refresh control into the list
    [self.tableView addSubview:self.refreshControl];
}

/*
 Function: fetchTimeline
 Purpose: Makes a API request, which then calls the completion to pass back the data.
          Updates the tableView with the new data. Hides the RefreshControl.
 */
-(void)fetchTimeline{
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            //View controller stores the data passed into the completion handler
            self.tweets = [NSArray arrayWithArray: tweets];
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            for (Tweet *array in tweets) {
                NSString *text = array.text;
                NSLog(@"text we got %@", text);
            }
            //reload table view, which will call numberOfRows and cellForRowAt
            [self.tableView reloadData];
            
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
            
        }
        [self.refreshControl endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// Returns an instance of the custom cell with that reuse identifier with its elements
// populated with data at the index asked for
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    Tweet *tweet = self.tweets[indexPath.row];
    cell.nameLabel.text = tweet.user.name; //username 
    cell.handleLabel.text = tweet.user.screenName; //handle
    cell.tweetLabel.text = tweet.text; //tweet content
    
    if (tweet.text.length == 0){
        NSLog(@"empty text");
    }
    
    //Access image
    NSString *fullProfileImageURLString = tweet.user.profileImage;
    NSURL *profileImageURL = [NSURL URLWithString:fullProfileImageURLString];
    cell.profileImage.image = nil;
    [cell.profileImage setImageWithURL:profileImageURL];
    return cell;
    
}

// Returns the number of items returned from the API
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)closeButton:(id)sender {
}

- (IBAction)tweetButton:(id)sender {
}
@end
