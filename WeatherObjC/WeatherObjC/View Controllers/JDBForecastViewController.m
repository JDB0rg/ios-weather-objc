//
//  JDBForecastViewController.m
//  WeatherObjC
//
//  Created by Madison Waters on 3/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JDBForecastViewController.h"
#import "JDBWeatherCollectionViewCell.h"

@interface JDBForecastViewController () 

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation JDBForecastViewController

#pragma mark - View Controller Methods
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _forecastController = [[JDBForecastController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _forecastController = [[JDBForecastController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    self.collectionView.dataSource = self;
    // Do any additional setup after loading the view.
}

#pragma mark - Search Bar Delegate Methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *text = searchBar.text;
    if(text.length == 0) { return; }
    
    [self.forecastController fetchForecastInZip:text completion:^(NSError *error) {
        
    }];
}

#pragma mark - CollectionView DataSource Methods

- (nonnull __kindof JDBWeatherCollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JDBWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    JDBForecast *forecast = [self.forecastController.forecasts objectAtIndex:indexPath.item];
    
    cell.imageView.image = forecast.image;
    
    NSString *cityString = forecast.city;
    NSString *tempString = [forecast.temp stringValue];
    NSString *forecastString = [NSString stringWithFormat:@"%@/%@", cityString, tempString];
    cell.weatherLabel.text = forecastString;
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.forecastController.forecasts.count;
}

@end
