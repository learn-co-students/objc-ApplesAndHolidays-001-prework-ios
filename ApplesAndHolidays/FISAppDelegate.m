//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    
    return YES;
}

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *filterForApple = [NSPredicate predicateWithFormat:@"self == 'apple'"];
    NSArray *occurencesOfApple = [fruits filteredArrayUsingPredicate:filterForApple];
    
    return occurencesOfApple;
}

- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    
    NSArray *holidaysInArgSeason = [database[season] allKeys];
    
    return holidaysInArgSeason;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database {
    
    NSArray *suppliesInArgHolidayInArgSeason = [database[season][holiday] copy];
    
    return suppliesInArgHolidayInArgSeason;
}

- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {
    
    NSPredicate *filterForHolidayInSeason = [NSPredicate predicateWithFormat:@"self == %@", holiday];
    NSArray *holidayInArgSeason = [[self holidaysInSeason:season inDatabase:database] filteredArrayUsingPredicate:filterForHolidayInSeason];
    
    return [holidayInArgSeason count];
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    
    NSPredicate *filterForSupplyInHolidayInSeason = [NSPredicate predicateWithFormat:@"self == %@", supply];
    NSArray *supplyInArgHolidayInArgSeason = [[self suppliesInHoliday:holiday inSeason:season inDatabase:database] filteredArrayUsingPredicate:filterForSupplyInHolidayInSeason];
    
    return [supplyInArgHolidayInArgSeason count];
}

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    
    NSMutableDictionary *mutableDatabase = [database mutableCopy];
    
    mutableDatabase[season][holiday] = [[NSMutableArray alloc] init];
    
    return mutableDatabase;
}

- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    
    NSMutableDictionary *mutableDatabase = [database mutableCopy];
    
    [mutableDatabase[season][holiday] addObject:supply];
    
    return mutableDatabase;
}

@end