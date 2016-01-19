//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}


-(NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *filterForApples = [NSPredicate predicateWithFormat:@"self LIKE[cd] 'apple'"];
    return [fruits filteredArrayUsingPredicate:filterForApples];
    
}

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    return [database[season] allKeys];
    
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
    
    NSMutableDictionary *seasonToAdd = database[season];
    seasonToAdd[holiday] = @{};
    return database;
    
}
-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *holidaySupplies = [database[season][holiday] mutableCopy];
    
    [holidaySupplies addObject:supply];
    
    database[season][holiday] = holidaySupplies;
    
    return database;
    
}

@end