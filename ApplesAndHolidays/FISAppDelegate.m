//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray*)pickApplesFromFruits: (NSArray*)fruits {
    
        NSPredicate *apples = [NSPredicate predicateWithFormat:@"self == 'apple'"];
        NSArray *applesCount = [fruits filteredArrayUsingPredicate:apples];
    
        return applesCount;
}

- (NSArray*)holidaysInSeason: (NSString*)season inDatabase:(NSDictionary*)database {
    
    return [database[season] allKeys];
    
}
- (NSArray*)suppliesInHoliday:(NSString*)holiday inSeason:(NSString*)season inDatabase:(NSDictionary*)database {
    
    return [NSArray arrayWithArray:database[season][holiday]];
    
}
- (BOOL*)holiday:(NSString*)holiday isInSeason: (NSString*)season inDatabase: (NSDictionary*)database {
    
    return [[database[season] allKeys] containsObject:holiday];
}
- (BOOL*)supply:(NSString*)supply isInHoliday: (NSString*)holiday inSeason: (NSString*)season inDatabase: (NSDictionary*)databse {
    
    return [databse[season][holiday] containsObject:supply];
}

- (NSDictionary*)addHoliday: (NSString*)holiday toSeason: (NSString*)season inDatabase: (NSDictionary*)database {
    
    database[season][holiday] = [[NSMutableArray alloc]init];

    return database;
}


- (NSDictionary*)addSupply: (NSString*)supply toHoliday: (NSString*)holiday inSeason: (NSString*)season inDatabase: (NSDictionary*)database {
    
    [database[season][holiday] addObject:supply];
    
    return database;
}

@end