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
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    NSArray *appleFruits = [fruits filteredArrayUsingPredicate:applePredicate];
    return appleFruits;
}


-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *holidays = [ database[season] allKeys];
    return holidays;
}


-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *suppliesByHoliday = database[season][holiday];
    NSMutableArray *supplies = [suppliesByHoliday mutableCopy];
    return supplies;
}


-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *holidays = [database[season] allKeys];
    BOOL contains = [holidays containsObject:holiday];
    return contains;
}


-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *supplies = database[season][holiday];
    BOOL contains = [supplies containsObject:supply];
    return contains;
}


-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    database[season][holiday] = [@[] mutableCopy];
    return database;
}


-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    [database[season][holiday] addObject:supply];
    return database;
}

@end