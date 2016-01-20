//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray *) pickApplesFromFruits: (NSArray *) fruits {
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:(@"self LIKE '*apple*'")];
    NSArray *hasApple = [fruits filteredArrayUsingPredicate:applePredicate];
    
    return hasApple;
    
}


- (NSArray *) holidaysInSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    NSDictionary *seasonDictionary = database[season];
    NSArray *holidayKeys = [seasonDictionary allKeys];
    
    return holidayKeys;
}

- (NSArray *) suppliesInHoliday: (NSString *) holiday inSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    NSMutableArray *holidayDictionary = [[NSMutableArray alloc] init];
    holidayDictionary = database[season][holiday];
    
    return holidayDictionary;
}

- (BOOL) holiday: (NSString *) holiday isInSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    NSDictionary *seasonDictionary = database[season];
    NSArray *holidayKeys = [seasonDictionary allKeys];
    
    BOOL doesContainThing = [holidayKeys containsObject:holiday] ? YES : NO;
    return doesContainThing;

    return self;
}

- (BOOL) supply:(NSString *)supply
    isInHoliday:(NSString *)holiday
       inSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {
    
    NSDictionary *holidays = database[season];
    NSArray *allItemsForHoliday = holidays[holiday];
    
    BOOL doesContainSupply = [allItemsForHoliday containsObject:supply] ? YES : NO;
    return doesContainSupply;
}

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    
    NSMutableDictionary *mSeasonDict = [database mutableCopy];
    
    NSMutableDictionary *holidaysForSeason = [mSeasonDict valueForKey:season];
    
    [holidaysForSeason setValue:@[] forKey:holiday];
    
    return mSeasonDict;
}

- (NSDictionary *) addSupply: (NSString *) supply toHoliday: (NSString *) holiday inSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    NSMutableDictionary *mSeasonDict = [database mutableCopy];
    NSMutableDictionary *holidaysForSeason = [mSeasonDict valueForKey:season];
    [holidaysForSeason setValue:supply forKey:holiday];
    
    return mSeasonDict;
}


@end