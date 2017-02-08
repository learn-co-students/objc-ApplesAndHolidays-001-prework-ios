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

-(NSArray*)pickApplesFromFruits:(NSArray *)fruits {
   NSPredicate *applePredicate = [NSPredicate predicateWithFormat: @"self CONTAINS[cd] 'apple'"];
    NSArray *pickedApples = [fruits filteredArrayUsingPredicate: applePredicate];
    return pickedApples;}

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSArray *holidaysFiltered = [database[season] allKeys];
    
    return holidaysFiltered;
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *suppliesFiltered = database[season][holiday];
    
    return suppliesFiltered;
}

-(BOOL*)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSArray *holidaysInSpecifiedSeason = [database[season] allKeys];
    
    BOOL holidayIsInSeason = [holidaysInSpecifiedSeason containsObject:holiday];
    
    return holidayIsInSeason;}


-(BOOL*)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSArray *suppliesInSpecifiedHoliday = database[season][holiday];
    
    BOOL supplyIsInHoliday = [suppliesInSpecifiedHoliday containsObject:supply];
    
    return supplyIsInHoliday;
}

-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableArray *addedHoliday = [[NSMutableArray alloc] init];
    
    database[season][holiday] = addedHoliday;
    
    return database;
}

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    [database[season][holiday] addObject:supply];
    
    return database;
}






@end