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
    return nil;
}

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    return Nil;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    return nil;
}

- (BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    return nil;
}

- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    return nil;
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