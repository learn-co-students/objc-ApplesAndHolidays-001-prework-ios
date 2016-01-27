//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}


-(NSArray *)PickApplesFromFruits:(NSArray *)fruits {
    NSPredicate *applesFromFruitsPredicate = [NSPredicate predicateWithFormat:@"fruits CONTAINS[c] 'apple'"];
    NSArray *fruitsThatAreApples = [fruits filteredArrayUsingPredicate:applesFromFruitsPredicate];
    
    return fruitsThatAreApples;
}

//

-(NSArray *)holidaysInSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    return [database[season]allKeys];
    //return an array of all of the "holiday" keys in the sub-dictionary associated with the submitted "season" argument
}

-(NSMutableArray *)suppliesInHoliday:(NSString *)holiday
                            inSeason:(NSString *)season
                          inDatabase:(NSDictionary *)database {
    return [NSMutableArray arrayWithArray:database[season][holiday]];
    //return the mutable array of all of the supplies for the submitted "holiday" in the submitted "season"
}

-(BOOL)holiday:(NSString *)holiday
    isInSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    return [[database [season] allKeys] containsObject:holiday];
    //return whether or not the submitted "season" contains a key that matches the "holiday" argument
}


-(BOOL)supply:(NSString *)supply
  isInHoliday:(NSString *)holiday
     inSeason:(NSString *)season
   inDatabase:(NSDictionary *)database {
    return [[database [season][holiday] allKeys]containsObject:supply];
    //return whether or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string.
}

//last 2

-(NSDictionary *)addHoliday:(NSString *)holiday
                   toSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    database [season][holiday] = [[NSMutableArray alloc]init];
    return database;
    //create a new key-value pair in the submitted "season" key's sub-dictionary that uses the submitted "holiday" as the key and sets up an empty mutable array as its value
}

-(NSDictionary *)addSupply:(NSString *)supply
                 toHoliday:(NSString *)holiday
                  inSeason:(NSString *)season
                inDatabase:(NSDictionary *)database {
    [database[season][holiday] addObject:supply];
    return database;
    //nsert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key
}








@end

