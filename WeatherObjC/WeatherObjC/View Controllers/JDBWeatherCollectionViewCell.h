//
//  JDBWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Madison Waters on 3/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDBWeatherCollectionViewCell : UICollectionViewCell 

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;

@end

NS_ASSUME_NONNULL_END
