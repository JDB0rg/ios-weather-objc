//
//  JDBForecastController.h
//  WeatherObjC
//
//  Created by Madison Waters on 3/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDBForecast.h"

typedef void(^ForecastCompletion)(NSError *);

NS_ASSUME_NONNULL_BEGIN

@interface JDBForecastController : NSObject

@property (nonatomic) NSArray *forecasts;

- (void)fetchForecastInZip:(NSString *)zipCode completion:(ForecastCompletion)completion;

@end

NS_ASSUME_NONNULL_END
