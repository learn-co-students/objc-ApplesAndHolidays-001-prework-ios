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

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self LIKE 'apple' "];
    NSArray *apples = [fruits filteredArrayUsingPredicate:applePredicate];
    return apples;
}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    //NSPredicate *holidayPredicate = [NSPredicate predicateWithFormat:@"self LIKE '%@' ", holiday];
    //NSArray *holidays = [database[season] filteredArrayUsingPredicate:holidayPredicate];
    NSLog(@" %@ ", database[season]);
    //return holidays
    return YES;
}

@end