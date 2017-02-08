//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

// predicate method to find 'apple' strings from an array of strings
- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    NSPredicate *applesInFruitArray = [NSPredicate predicateWithFormat:@"SELF == %@", @"apple"];
    NSArray *foundApples = [fruits filteredArrayUsingPredicate:applesInFruitArray];
    return foundApples;
}

// finally worked!
- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    
    for (NSString *eachSeason in database) {
        if ([eachSeason isEqualToString:season]) {
            return database[season];
        }
    }
    return nil;
}


// yes but I need to re-write it trying to use NSPredicate
- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database {
    for (NSString *eachSeason in database) {
        if ([eachSeason isEqualToString:season]) {
            for (NSString *eachHoliday in database[season]) {
                if ([eachHoliday isEqualToString:holiday]) {
                    return database[season][holiday];
                }
            }
        }
    }
    return nil;
}

// I need to try re-writing with NSPredicate
- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {
    for (NSString *eachSeason in database) {
        if ([eachSeason isEqualToString:season]) {
            for (NSString *eachHoliday in database[season]) {
                if ([eachHoliday isEqualToString:holiday]) {
                    return YES;
                }
            }
        }
    }
    return NO;
}


// ok. here I managed to use NSPredicate
- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {

    NSArray *supplyList = database[season][holiday];
    NSPredicate *supplyPredicate = [NSPredicate predicateWithFormat:@"SELF == %@",supply];
    NSArray *returnArray = [supplyList filteredArrayUsingPredicate:supplyPredicate];
    if ([returnArray count]) {
        return YES;
    }
    return NO;
}


// great! this is working, too!
- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    NSMutableDictionary *returnDictionary = [database mutableCopy];
    NSMutableArray *newSupplyListForAddedHoliday = [[NSMutableArray alloc]init];
    returnDictionary[season][holiday] = newSupplyListForAddedHoliday;
    
    return returnDictionary;
}


/* will work on it more tomorrow.... the other methods I mean because the database dictionary is already mutable...
the methods could have been a lot shorter.... anyways, I will revisit...*/
- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    NSMutableArray *supplyList = database[season][holiday];
    [supplyList addObject:supply];
    return database;
}


@end