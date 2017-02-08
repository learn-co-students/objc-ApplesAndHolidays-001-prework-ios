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

- (NSArray *)pickApplesFromFruits: (NSArray *)fruits {
    
    NSPredicate *fruitPredicate = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    
    NSArray *apples = [fruits filteredArrayUsingPredicate:fruitPredicate];
    
    return apples;
    
}



- (NSArray *)holidaysInSeason: (NSString *)season inDatabase:(NSDictionary *)database {
    
    
    NSDictionary *aSeason = database[season]; //value for key shorthand
    
    return aSeason.allKeys;
    
}


- (NSArray *)suppliesInHoliday: (NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSDictionary *aSeason = database[season];
    
    
    //suppliesInHoliday:inSeason:inDatabase: to return the mutable array of all of the supplies for the submitted "holiday" in the submitted "season".
    
    
    return aSeason[holiday];
    
}

- (BOOL)holiday: (NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    //holiday:isInSeason:inDatabase: to return whether or not the submitted "season" contains a key that matches the "holiday" argument.
    
    NSDictionary *aSeason = database[season];
    
    return (aSeason[holiday] != nil);
    
}

- (BOOL)supply: (NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
        //supply:isInHoliday:inSeason:inDatabase: to return whether or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string.
    
    
    NSDictionary *aSeason = database[season];
    NSArray *supplies = aSeason[holiday];
    
    for (NSString *aSupply in supplies) {
        if ([aSupply isEqualToString:supply]) {
            return YES;
        }
    }
    

    return NO;
}

- (NSDictionary *)addHoliday: (NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    
    NSMutableDictionary *aSeason = database[season];
    [aSeason setValue:@[].mutableCopy forKey:holiday];
        //addHoliday:toSeason:inDatabase: to create a new key-value pair in the submitted "season" key's sub-dictionary that uses the submitted "holiday" as the key and sets up an empty mutable array as its value.
    
    return database;

}

- (NSDictionary *)addSupply: (NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase: (NSDictionary *)database {
    
    NSDictionary *aSeason = database[season];
    NSMutableArray *supplies = aSeason[holiday];
    
    [supplies addObject:supply];
    
    //addSupply:toHoliday:inSeason:inDatabase: to insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.
    
    return database;

}
@end