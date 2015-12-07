//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray *) pickApplesFromFruits: (NSArray *) fruits {
    NSPredicate *fruitPredicate = [NSPredicate predicateWithFormat:@"self == 'apple'"];
    NSArray *apples = [fruits filteredArrayUsingPredicate:fruitPredicate];
    return apples;
}

- (NSArray *) holidaysInSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    NSArray *holidays = [database[season]allKeys];
    return holidays;
}

- (NSArray *) suppliesInHoliday: (NSString *) holiday inSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    NSMutableArray *supply = [[NSMutableArray alloc]initWithArray:database[season][holiday]];
    return supply;
}

- (BOOL) holiday: (NSString *) holiday isInSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    NSArray *method = [self holidaysInSeason:season inDatabase:database];
    BOOL answer;
    
    if ([method containsObject:holiday]) answer = YES; else answer = NO;
    
    return answer;
}

- (BOOL) supply: (NSString *) supply isInHoliday: (NSString *) holiday inSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    NSArray *sup = [self suppliesInHoliday:holiday inSeason:season inDatabase:database];
    BOOL result;
    
    if ([sup containsObject:supply]) result = YES; else result = NO;
    return result;
}

- (NSDictionary *) addHoliday: (NSString *) holiday toSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    [database mutableCopy];
    database[season][holiday] =@"";
    return database;
}

- (NSDictionary *) addSupply: (NSString *) supply toHoliday: (NSString *) holiday inSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    [database[season][holiday] addObject:supply];
    return database;
}


@end