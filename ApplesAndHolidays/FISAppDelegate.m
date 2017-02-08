//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    
    return YES;
}

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    NSArray *apples = [fruits filteredArrayUsingPredicate:applePredicate];
    
    return apples;
}


- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary*)database {
    
    return [database[season] allKeys];
}


- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database {
    
    return database[season][holiday];
}


- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {
    
    NSArray *seasonHolidayKey = [database[season] allKeys];
    BOOL seasonHoliday = [seasonHolidayKey containsObject:holiday];
    
    return seasonHoliday;
}


- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    
    NSArray *supplyHoliday = database[season][holiday];
    BOOL supplyInHoliday = [supplyHoliday containsObject:supply];
    
    return supplyInHoliday;
}


- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    
    NSMutableArray *mEmptyArray = [[NSMutableArray alloc] init];
    database[season][holiday] = mEmptyArray;
    
    return database;
}


- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    
    database[season][holiday] = supply;
    
    return database;
}


@end