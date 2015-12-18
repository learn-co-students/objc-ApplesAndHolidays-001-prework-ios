//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *applePredicate = [ NSPredicate predicateWithFormat:@"apples"];
    NSArray *apples = [fruits filteredArrayUsingPredicate:applePredicate];
    
    for (NSArray *apple in apples) {
        
    }

        return nil;
}

- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    
    return nil;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database {
    
    return nil;
    
}

- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {
    
    return YES;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    
    return YES;
}

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    
    return nil;
}

- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    
    return nil;
}


@end