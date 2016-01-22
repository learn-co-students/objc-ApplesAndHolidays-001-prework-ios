//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits{
    NSPredicate *apples = [NSPredicate predicateWithFormat:@"self CONTAINS[cd] 'apple'"];
    NSArray *applesResult = [fruits filteredArrayUsingPredicate:apples];
    
    return applesResult;
}

// Returns an array of all holiday keys in the sub-dictionary associated with the submitted "season" argument
- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSMutableArray *holidayArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *holiday in database[season]) {
        [holidayArray addObject:holiday];
    }
    
    return holidayArray;
}

// Returns an array of all supplies for a submitted "season" and "holiday"
- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSMutableArray *supplyArray = [[NSMutableArray alloc] init];
    
    for (NSString *supply in database[season][holiday]) {
        [supplyArray addObject:supply];
    }
    
    return supplyArray;
}

// Tests whether a submitted "season" contains a submitted "holiday"
- (BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    BOOL holidayInSeason = NO;
    
    if (database[season][holiday]) {
        holidayInSeason = YES;
    }
    
    return holidayInSeason;
}
// Tests if a submitted "supply" string is contained in the supply array for a submitted "season" and submitted "holiday"
- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSArray *supplyList = database[season][holiday];
    BOOL supplyInList = NO;
    
    for (NSUInteger i = 0; i < [supplyList count]; i++) {
        if ([supplyList[i] isEqualToString:supply]) {
            supplyInList = YES;
        }
    }
    
    return supplyInList;
}

// Create new key-value pair with empty array value paired with submitted "holiday" key for the submitted "season"
- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSMutableArray *mSupplyArray = [[NSMutableArray alloc] init];
    
    database[season][holiday] = mSupplyArray;
    
    return database;
}

// Add submitted "supply" to submitted "holiday"
- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    [database[season][holiday] addObject:supply];
    
    return database;
}

@end