//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

//return an NSArray of all of the occurrences of the string @"apple" in the argument array fruits
- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    NSArray *appleArray = [fruits filteredArrayUsingPredicate:applePredicate];
    return appleArray;
}

//return an array of all of the "holiday" keys in the sub-dictionary associated with the submitted "season" argument.
- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    
    NSArray *keysForSeason = [database[season] allKeys];
    return keysForSeason;
}

//return the mutable array of all of the supplies for the submitted "holiday" in the submitted "season".
- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database {
    
    NSMutableArray *partySupplies = [[NSMutableArray alloc] init];
    partySupplies = database[season][holiday];
    
    return partySupplies;
}

//return whether or not the submitted "season" contains a key that matches the "holiday" argument.
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

//return whether or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string.
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

//create a new key-value pair in the submitted "season" key's sub-dictionary that uses the submitted "holiday" as the key and sets up an empty mutable array as its value.
- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    
    NSMutableArray *newSupplies = [[NSMutableArray alloc] init];
    [database[season] setObject:newSupplies forKey:holiday];
    return database;
}

//insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.
- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    
    [database[season][holiday] addObject:supply];

    return database;
}


@end