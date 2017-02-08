//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits{
    
    NSPredicate *applesPredicate = [NSPredicate predicateWithFormat:@"self CONTAINS[c] 'apple'"];
    NSArray *applesArray = [fruits filteredArrayUsingPredicate:applesPredicate];
    return applesArray;
}

-(NSArray *)holidaysInSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database{
    
    NSArray *allKeysArray = [NSArray new];
    allKeysArray = [database[season] allKeys];
    return allKeysArray;
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday
                     inSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database{
    
    NSMutableArray *supplies = [NSMutableArray new];
    supplies = database[season][holiday];
    return supplies;
}

-(BOOL)holiday:(NSString *)holiday
    isInSeason:(NSString *)season
    inDatabase:(NSDictionary *)database{
    
    if ([[database[season] allKeys] containsObject:holiday] ) {
        return YES;
    }else {
         return NO;
    }
}

-(BOOL)supply:(NSString *)supply
  isInHoliday:(NSString *)holiday
     inSeason:(NSString *)season
   inDatabase:(NSDictionary *)database{

    if ([database[season][holiday] containsObject:supply]) {
        return YES;
    } else{
        return NO;
    }
}


-(NSDictionary *)addHoliday:(NSString *)holiday
                   toSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database{
    
    database[season][holiday] = [NSMutableArray new];
    return database;
}

-(NSDictionary *)addSupply:(NSString *)supply
                 toHoliday:(NSString *)holiday
                  inSeason:(NSString *)season
                inDatabase:(NSDictionary *)database{
    
    [database[season][holiday] addObject:supply];
    return database;
}

@end