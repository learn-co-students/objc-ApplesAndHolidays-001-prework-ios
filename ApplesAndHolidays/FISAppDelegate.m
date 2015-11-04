//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    NSArray *appleOccurrences = [fruits filteredArrayUsingPredicate:applePredicate];
    return appleOccurrences;
}
- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    NSArray *holidaysForSeason = [database[season] allKeys];
    return holidaysForSeason;
}
- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database {
    NSArray *suppliesForHoliday = database[season][holiday];
    return suppliesForHoliday;
}
- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {
    BOOL isHolidayInSeason = [[database[season] allKeys] containsObject:holiday];
    return isHolidayInSeason;
}
- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    BOOL isSupplyInHoliday = [database[season][holiday] containsObject:supply];
    return isSupplyInHoliday;
}
- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    NSMutableArray *emptySupplies = [[NSMutableArray alloc] init];
    [database[season] setObject:emptySupplies forKey:holiday];
    return database;
}
- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    [database[season] setObject:supply forKey:holiday];
    return database;
}


@end