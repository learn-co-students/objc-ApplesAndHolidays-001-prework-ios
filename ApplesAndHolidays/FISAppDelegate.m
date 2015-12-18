//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    NSArray *appleArray = [fruits filteredArrayUsingPredicate:applePredicate];
    return appleArray;
}

- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    
    NSArray *keysForSeason = [database[season] allKeys];
    return keysForSeason;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database {
    
    NSMutableArray *partySupplies = [[NSMutableArray alloc] init];
    partySupplies = database[season][holiday];
    
    return partySupplies;
    
}

- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {

    for (NSString *day in database[season]) {
        if ([day isEqualToString:holiday]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    
    
    for (NSString *item in database[season][holiday]) {
        if ([item isEqualToString:supply]) {
            return YES;
        }
    }
    return NO;
}

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    
    NSMutableArray *newSupplies = [[NSMutableArray alloc] init];
    [database[season] setObject:newSupplies forKey:holiday];
    return database;
}

- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    
    [database[season][holiday] addObject:supply];
    
    return database;
}


@end