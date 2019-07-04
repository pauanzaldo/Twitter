//
//  TweetCell.m
//  twitter
//
//  Created by panzaldo on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@implementation TweetCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

/*
 Action: didTapFavorite
 Purpose: Updates the local model (tweet) properties to reflect it’s
 been favorited by updating the favorited bool and incrementing the favoriteCount.
 */
- (IBAction)didTapFavorite:(UIButton *)sender {
    
    //if Tweet is already favorited, unfavorite it
    if(self.tweet.favorited){
        self.tweet.favorited = NO;
        self.favoriteLabel.text = [@(--self.tweet.favoriteCount) stringValue]; //Update cell UI
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon.png"] forState:UIControlStateNormal];
        
    } else {
        self.tweet.favorited = YES;
        self.favoriteLabel.text = [@(++self.tweet.favoriteCount) stringValue];
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red.png"] forState:UIControlStateNormal];
    }
    //Send a POST request to the POST favorites/create endpoint
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(tweet){
             NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
        }
        else{
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
    }];
    
 
}


- (IBAction)didTapRetweet:(UIButton *)sender {
    //if Tweet is already favorited, unfavorite it
    if(self.tweet.retweeted){
        self.tweet.retweeted = NO;
        self.favoriteLabel.text = [@(--self.tweet.retweetCount) stringValue]; //Update cell UI
        [self.favoriteButton setImage:[UIImage imageNamed:@"retweet-icon.png"] forState:UIControlStateNormal];
    } else {
        self.tweet.retweeted = YES;
        self.retweetLabel.text = [@(++self.tweet.retweetCount) stringValue];
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green.png"] forState:UIControlStateNormal];
    }
    //Send a POST request to the POST favorites/create endpoint
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(tweet){
            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
        }
        else{
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
    }];
}


@end
