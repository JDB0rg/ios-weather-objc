//
//  JDBForecastController.m
//  WeatherObjC
//
//  Created by Madison Waters on 3/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

//https://samples.openweathermap.org/data/2.5/forecast/daily?
//zip=84042&
//appid=1b315ce482cdd139995916367712093b
#import "JDBForecastController.h"

static NSString *baseURLString = @"http://api.openweathermap.org/data/2.5/forecast/daily?";
static NSString *apiKey = @"1b315ce482cdd139995916367712093b";

@implementation JDBForecastController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _forecasts = [NSMutableArray array];
    }
    return self;
}

- (void)fetchForecastInZip:(NSString *)zipCode completion:(ForecastCompletion)completion {
    
    NSURLComponents * urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
    NSURLQueryItem *zip = [NSURLQueryItem queryItemWithName:@"zip" value:zipCode];
    NSURLQueryItem *appid = [NSURLQueryItem queryItemWithName:@"appid" value:apiKey];
    urlComponents.queryItems = @[ zip, appid ];
    NSURL *url = urlComponents.URL;
    NSLog(@"BaseURL: %@", url);
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching forecast: %@", error);
            completion(error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (!dictionary) {
            NSLog(@"Error decoding json: %@", error);
            completion(error);
            return;
        }
        
        NSArray *forecastDictionaries = dictionary[@"city"];
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in forecastDictionaries) {
            JDBForecast *forecast = [[JDBForecast alloc] initWithDictionary:dict city:zipCode];
            [forecasts addObject:forecast];
        }
        
    }];
    [task resume];
}

@end
