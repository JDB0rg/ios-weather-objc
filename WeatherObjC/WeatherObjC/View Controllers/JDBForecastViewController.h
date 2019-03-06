//
//  JDBForecastViewController.h
//  WeatherObjC
//
//  Created by Madison Waters on 3/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDBForecastController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDBForecastViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource>

@property JDBForecastController *forecastController;

@end

NS_ASSUME_NONNULL_END
