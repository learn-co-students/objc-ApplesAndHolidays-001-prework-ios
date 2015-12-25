//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray*)pickApplesFromFruits:(NSArray*)fruits {
    NSPredicate *appleOccurances = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    
    return [fruits filteredArrayUsingPredicate:appleOccurances];
}

-(NSArray*)holidaysInSeason:(NSString*)season inDatabase:(NSDictionary*)database {
    return [database[season] allKeys];
}

-(NSArray*)suppliesInHoliday:(NSString*)holiday inSeason:(NSString*)season inDatabase:(NSDictionary*)database {
    return database[season][holiday];
}

-(BOOL)holiday:(NSString*)holiday isInSeason:(NSString*)season inDatabase:(NSDictionary*)database {
    NSPredicate *holidayPredicate = [NSPredicate predicateWithFormat:@"self CONTAINS %@",holiday];
    NSArray *filteredArray = [[self holidaysInSeason:season
                                          inDatabase:database] filteredArrayUsingPredicate:holidayPredicate];
    return [filteredArray count];
}

-(BOOL)supply:(NSString*)supply isInHoliday:(NSString*)holiday inSeason:(NSString*)season inDatabase:(NSDictionary*)database {
    NSPredicate *supplyPredicate = [NSPredicate predicateWithFormat:@"self CONTAINS %@",supply];
    NSArray *filteredArray = [[self suppliesInHoliday:holiday
                                             inSeason:season
                                           inDatabase:database] filteredArrayUsingPredicate:supplyPredicate];
    return [filteredArray count];
}

-(NSDictionary*)addHoliday:(NSString*)holiday toSeason:(NSString*)season inDatabase:(NSDictionary*)database {
    database[season][holiday] = [[NSMutableArray alloc] init];
    return database;
}

-(NSDictionary*)addSupply:(NSString*)supply toHoliday:(NSString*)holiday inSeason:(NSString*)season inDatabase:(NSDictionary*)database {
    [database[season][holiday] addObject:supply];
    return database;
}

@end