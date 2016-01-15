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

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits
    {
        NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self LIKE[cd] 'apple'"];
        
        NSArray *appleInstances = [fruits filteredArrayUsingPredicate:applePredicate];
        
        return appleInstances;
        
    }

- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSDictionary *specificSeason = database[season];
    
    NSArray *holidaysInSpecficSeason = [specificSeason allKeys];
    
    return holidaysInSpecficSeason;
    
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableArray *suppliesForHoliday = [[NSMutableArray alloc] init];
    
    suppliesForHoliday = database[season][holiday];
    
    return  suppliesForHoliday;
}

- (BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    
    NSArray *holidaysInSeason = [database[season] allKeys];
    
    BOOL holidayInThisSeason = [holidaysInSeason containsObject:holiday];
    
    return holidayInThisSeason;
}

- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableArray *suppliesInHolidayInSeason = database[season][holiday];
    
    BOOL isSupplyContained = [suppliesInHolidayInSeason containsObject:supply];
    
    return isSupplyContained;
}

- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableDictionary *updatedSeason = [database mutableCopy];
    
    NSMutableArray *newHoliday = [[NSMutableArray alloc] init];
    
    [updatedSeason[season] setObject:newHoliday forKey:holiday];
    
    return updatedSeason;
}

- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableDictionary *updatedDatabase = [database mutableCopy];
    
    NSMutableArray *supplyList = updatedDatabase[season][holiday];
    
    [supplyList addObject:supply];
    
    return updatedDatabase;
}


@end