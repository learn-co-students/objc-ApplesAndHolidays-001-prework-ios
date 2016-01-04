//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray*) pickApplesFromFruits:(NSArray *)fruits{
    return [fruits filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"]];
}

- (NSArray*) holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    return [database[season] allKeys];

}

- (NSArray*) suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    return database[season][holiday];
}

- (BOOL) holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    return [[[self holidaysInSeason:season inDatabase:database]
      filteredArrayUsingPredicate:
      [NSPredicate predicateWithFormat:@"self CONTAINS %@", holiday]] count]>0;
}

- (BOOL) supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    return [[database[season][holiday] filteredArrayUsingPredicate:
     [NSPredicate predicateWithFormat:@"self CONTAINS %@", supply]]count]>0;
}

- (NSDictionary*) addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    //NSMutableDictionary _holiday = [@[] mutableCopy];
    NSMutableDictionary* result = [database mutableCopy];
    result[season][holiday] =[@[] mutableCopy];
    
    return result;
}

- (NSDictionary*) addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableDictionary* result = [database mutableCopy];
    [result[season][holiday] addObject:supply];
    
    return result;
}




















@end