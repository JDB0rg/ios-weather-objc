//
//  JDBForecast.h
//  WeatherObjC
//
//  Created by Madison Waters on 3/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDBForecast : NSObject

@property NSString *city;
@property NSNumber *temp;
@property UIImage *image;

- (instancetype)initWithCity:(NSString *)city temp:(NSNumber *)temp image:(UIImage *)image;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary city:(NSString *)city;

@end

NS_ASSUME_NONNULL_END
