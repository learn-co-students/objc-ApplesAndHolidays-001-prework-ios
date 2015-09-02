//
//  FISAppDelegate.m
//  ApplesAndHolidays
//
//  Created by Al Tyus on 5/30/14.
//  Copyright (c) 2014 com.flatironschool. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits
{
  NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] 'apple'"];
  NSArray *appleFilter = [fruits filteredArrayUsingPredicate:applePredicate];
  

  return appleFilter;
}

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
  NSArray *holidaysInSeason = [[NSArray alloc]init];
  holidaysInSeason = database[season];
  return holidaysInSeason;
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
  NSMutableArray *suppliesInHoliday = [[NSMutableArray alloc]init];
  suppliesInHoliday = database[season][holiday];
  return suppliesInHoliday;
}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
  // loop through the database entries which are each have dictionary as value
  // holiday : array of something we don't care about
//  BOOL holidayBool;
//  NSPredicate *holidayInSeason = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] holiday"];
  
  NSDictionary *seasonHolidays = database[season];
  return seasonHolidays[holiday] != nil;
  
//  NSArray *holidayFilter = [database[season] filteredArrayUsingPredicate:holidayInSeason];
//  
//  if (holidayFilter.count == 0) {
//    holidayBool = false;
//  
//  }
//  else holidayBool = true;
//  
//  return holidayBool;
}

-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
  NSArray *supplyHoliday = database[season][holiday];
  NSPredicate *supplyInHoliday = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", supply];
  NSArray *supplyFilter = [supplyHoliday filteredArrayUsingPredicate:supplyInHoliday];
  return supplyFilter.count > 0;
  
}

-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
  NSMutableDictionary *mutableDatabase = [database mutableCopy];
  NSMutableArray *addedHoliday = [[NSMutableArray alloc]init];
  mutableDatabase [season][holiday]=addedHoliday;

  return mutableDatabase;
}

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
  NSMutableDictionary *mutableDatabase = [database mutableCopy];
  [mutableDatabase[season][holiday] addObject:supply];

  return mutableDatabase;
}



@end