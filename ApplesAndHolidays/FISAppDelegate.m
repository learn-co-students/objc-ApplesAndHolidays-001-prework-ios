//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}



-(NSArray*)pickApplesFromFruits:(NSArray*)fruits; {
    NSPredicate *applePredicate= [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    NSArray *numberOfApples = [fruits filteredArrayUsingPredicate:applePredicate];
    return numberOfApples;
}

-(NSArray*)holidaysInSeason:(NSString*)season
                 inDatabase:(NSDictionary*)database; {
    NSArray *specificHolidaysInSeason=[database[season] allKeys];
    return specificHolidaysInSeason;
}

-(NSArray*)suppliesInHoliday:(NSString*)holiday
                    inSeason:(NSString*)season
                  inDatabase:(NSDictionary*)database; {
    return database[season][holiday];
}

-(BOOL)holiday:(NSString*)holiday
    isInSeason:(NSString*)season
    inDatabase:(NSDictionary*)database; {
    return [[self holidaysInSeason:season inDatabase:database] containsObject:holiday];
 
}

-(BOOL)supply:(NSString*)supply
  isInHoliday:(NSString*)holiday
     inSeason:(NSString*)season
   inDatabase:(NSDictionary*)database; {
     return [[self suppliesInHoliday:holiday inSeason:season inDatabase:database] containsObject:supply];
}

-(NSDictionary*)addHoliday:(NSString*)holiday
                  toSeason:(NSString*)season
                inDatabase:(NSDictionary*)database; {
    NSMutableArray *array=[[NSMutableArray alloc]init];
    database[season][holiday]=array;
    return database;
}

-(NSDictionary*)addSupply:(NSString*)supply
                toHoliday:(NSString*)holiday
                 inSeason:(NSString*)season
               inDatabase:(NSDictionary*)database; {
    database[season][holiday] = supply;
    return database;
}

/**
 
 * Implement your methods here.
 
 */

@end