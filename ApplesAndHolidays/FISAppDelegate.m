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
-(NSArray *)pickApplesFromFruits:(NSArray *)fruits;{
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    NSArray *applesPicked = [fruits filteredArrayUsingPredicate:applePredicate];
    return applesPicked;
}

-(NSArray *)holidaysInSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database; {
    NSArray *holidaysInSeason = [database[season] allKeys];
    return holidaysInSeason;
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday
                     inSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database; {
    NSArray *suppliesInHoliday = database[season][holiday];
    return suppliesInHoliday;
}

-(BOOL)holiday:(NSString *)holiday
    isInSeason:(NSString *)season
    inDatabase:(NSDictionary *)database; {
    if ([[database[season] allKeys ]containsObject:holiday]) {
        return YES;
    }
    return NO;
}

-(BOOL)supply:(NSString *)supply
  isInHoliday:(NSString *)holiday
     inSeason:(NSString *)season
   inDatabase:(NSDictionary *)database; {
    if ([database[season][holiday] containsObject:supply]) {
        return YES;
    }
    return NO;
}

-(NSDictionary *)addHoliday:(NSString *)holiday
                   toSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database; {
    database[season][holiday] =[[NSMutableArray alloc] init];
    return database;
}

-(NSDictionary *)addSupply:(NSString *)supply
                 toHoliday:(NSString *)holiday
                  inSeason:(NSString *)season
                inDatabase:(NSDictionary *)database; {
    [database[season][holiday] addObject:supply];
    return database;
}

@end