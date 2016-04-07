//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    NSPredicate *applesPredicate = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    NSArray *apples = [fruits filteredArrayUsingPredicate:applesPredicate];
    
    return apples;
}

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
   //database[season][holiday][supplies]
    
    NSArray *holidays = database[season];
    return holidays;
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    return database[season][holiday];
}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    BOOL holidayisInSeason = database[season][holiday];
    
    return holidayisInSeason;
}

-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    BOOL supplyIsFound = NO;
    NSArray *listofSuppliesInHolidayInSeason = [self suppliesInHoliday:holiday inSeason:season inDatabase:database];
    
    for (NSString *supplies in listofSuppliesInHolidayInSeason) {
        if ([supplies isEqualToString:supply]) {
            supplyIsFound = YES;
        }
    }
    return supplyIsFound;
}

-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    //Best Practice is to check if holiday is in dictionary** first
    NSMutableArray *emptySupplyList = [[NSMutableArray alloc] init];
    //database[season][holiday]; just discovered its redundant!
    database[season][holiday] = emptySupplyList;
    
    return database;
}

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season
                inDatabase:(NSDictionary *)database{
    [database[season][holiday] addObject:supply];
    return database;
}


@end