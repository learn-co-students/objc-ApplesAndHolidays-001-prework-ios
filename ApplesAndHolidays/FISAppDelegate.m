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

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self LIKE 'apple' "];
    NSArray *apples = [fruits filteredArrayUsingPredicate:applePredicate];
    return apples;
}

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *holidays = [database[season] allKeys];
    return holidays;
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    return database[season][holiday];
}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *holidays = [self holidaysInSeason:season inDatabase:database];
    return [holidays containsObject:holiday];
}

-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    return [database[season][holiday] containsObject:supply];
}

-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableDictionary *targetSeason = database[season];
    [targetSeason setObject:@[] forKey:holiday];
    return database;
}

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableArray *targetHoliday = database[season][holiday];
    [targetHoliday addObject:supply];
    return database;
}

@end