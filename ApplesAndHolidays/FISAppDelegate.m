//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits
{
      NSPredicate *applesPredicate = [NSPredicate predicateWithFormat:@"self == 'apple'"];
    
      return [fruits filteredArrayUsingPredicate:applesPredicate];
    }
- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
      return [database objectForKey:season];
    }

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database
{
      return [[database objectForKey:season] objectForKey:holiday];
    }

- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database
{
      return [[database objectForKey:season] objectForKey:holiday];
    }

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database
{
      NSArray *supplies = [[database objectForKey:season] objectForKey:holiday];
    
      NSPredicate *supplyPredicate = [NSPredicate predicateWithFormat:@"self CONTAINS %@", supply];
      supplies = [supplies filteredArrayUsingPredicate:supplyPredicate];
    
      if (supplies.count > 0) return YES;
      return NO;
    }

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database
{
      NSMutableDictionary *holidays = [database objectForKey:season];
      [holidays setObject:@[] forKey:holiday];
      return database;
    }

- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database
{
      NSMutableArray *supplies = [[database objectForKey:season] objectForKey:holiday];
      [supplies addObject:supply];
      return database;
    }

@end