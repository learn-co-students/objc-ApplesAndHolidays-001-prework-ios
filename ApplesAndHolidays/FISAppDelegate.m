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

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits
{
    NSMutableArray *applesArray = [[NSMutableArray alloc] init];
    for (NSString *fruit in fruits) {
        if ([fruit isEqualToString:@"apple"]) {
            [applesArray addObject:fruit];
        }
    }
    return applesArray;
}

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    NSArray *holidays = [database[season] allKeys];
    return holidays;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    return database[season][holiday];
}

- (BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    for (NSString *h in database[season]) {
        if ([h isEqualToString:holiday]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    for (NSString *s in database[season][holiday]) {
        if ([s isEqualToString:supply]) {
            return YES;
        }
    }
    return NO;
}

- (NSDictionary *)addHoliday:(NSString *)holiday toSeason :(NSString *)season inDatabase:(NSDictionary *)databse
{
    return nil;
}

- (NSDictionary *)addSupply:(NSDictionary *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)databse
{
    return nil;
}


@end