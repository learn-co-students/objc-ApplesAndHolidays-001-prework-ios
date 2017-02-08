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

// Apple picker methods


/**
 
 pickApplesFromFruits: which takes one NSArray argument fruits and returns an NSArray.

holidaysInSeason:inDatabase: which takes two arguments, an NSString called season and an NSDictionary called database, and returns an NSArray.

suppliesInHoliday:inSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSArray.

holiday:isInSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns a BOOL.

supply:isInHoliday:inSeason:inDatabase: which takes four arguments: an NSString called supply, an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns a BOOL.

addHoliday:toSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSDictionary.

addSupply:toHoliday:inSeason:inDatabase: which takes four arguments: an NSString called supply, an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSDictionary.

*/

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self == 'apple'"];
    NSArray *apples = [fruits filteredArrayUsingPredicate:applePredicate];
    
    return apples;
}

// Holiday supplies methods

- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    
    return [database[season] allKeys];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database {
    
    return [NSArray arrayWithArray:database[season][holiday] ];
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {
    
    return [[database[season] allKeys] containsObject:holiday];
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    
    return [database[season][holiday] containsObject:supply];
}

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    
    database[season][holiday] = [[NSMutableArray alloc] init];
    
    return database;
}

- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    
    [database[season][holiday] addObject:supply];
    
    return database;
}
@end