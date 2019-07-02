//
//  User.h
//  twitter
//
//  Created by panzaldo on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

//Properties
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;

// Initializer that can set all the properties based on the dictionary (user).
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


//More properties

@end

NS_ASSUME_NONNULL_END
