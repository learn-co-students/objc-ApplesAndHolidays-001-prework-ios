//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

// Objectives:
// 1. Use NSPredicate to filter objects in an array.
// 2. Practice accessing a nested collection.

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */


- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat: @"self CONTAINS 'apple'"];
    NSMutableArray *returnArray = [[fruits filteredArrayUsingPredicate:applePredicate] mutableCopy];
    
    return returnArray;
}

// return an array of all of the "holiday" keys in the sub-dictionary associated with the submitted "season" argument.
- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
   
    NSArray *returnArray = [database[season] allKeys];
    return returnArray;
     
}

// return the mutable array of all of the supplies for the submitted "holiday" in the submitted "season".
- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *returnArray = database[season][holiday];
    return returnArray;

}

// return whether or not the submitted "season" contains a key that matches the "holiday" argument.
- (BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *returnArray = database[season][holiday];
    [returnArray containsObject:holiday];
    return returnArray;
}

// return whether or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string.
- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *returnArray = database[season][holiday];
    [returnArray containsObject:supply];
    return returnArray;
    
}

- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    [database[season] setValue:newArray forKey:holiday];
    return database;
}

// to insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.
- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    [database[season][holiday] addObject:supply];
    return database;
}

@end