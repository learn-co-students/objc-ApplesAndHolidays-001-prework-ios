//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

//Given array of fruits, filter and return just the occurrences of 'apple'
- (NSArray *)pickApplesFromFruits:(NSArray *)fruits{
    NSPredicate * applePredicate = [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    NSArray * apples = [fruits filteredArrayUsingPredicate:applePredicate];
    
    return apples;
}

/*suppliesBySeasonAndHoliday =
 @{ @"Winter" : [@{ @"Christmas Day"    : [@[ @"plastic tree"   ,
                                            @"tinsel"         ,
                                            @"lights"         ,
                                            @"presents"       ,
                                            @"wreath"         ,
                                            @"mistletoe"      ,
                                            @"Christmas music"
                                                ] mutableCopy],
                @"New Year's Day"   : [@[ @"party hats"     ,
                                            @"kazoos"         ,
                                            @"champagne"
                                                ] mutableCopy]
                    } mutableCopy],
 @"Spring" : [@{ @"Memorial Day"     : [@[ @"American flag"  ,
                                            @"memoirs"
                                                ] mutableCopy]
                } mutableCopy],
 @"Summer" : [@{ @"Independence Day" : [@[ @"fireworks"      ,
                                            @"barbeque"       ,
                                            @"picnic blanket" ,
                                            @"sunscreen"
                                                ] mutableCopy],
                @"Labor Day"        : [@[ @"white jeans"    ,
                                            @"shopping bag"
                                                ] mutableCopy]
                } mutableCopy],
 @"Fall"   : [@{ @"Veteran's Day"    : [@[ @"barbeque"       ,
                                            @"American flag"
                                                ] mutableCopy],
            @"Thanksgiving Day" : [@[ @"turkey"         ,
                                        @"gravy"          ,
                                        @"mashed potatoes",
                                        @"acorn squash"   ,
                                        @"cranberry sauce",
                                        @"napkins"
                                            ] mutableCopy]
                } mutableCopy]
 };
*/

//Given season and season-holiday-supply mapping, return list of holidays in season
- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database{
    
    return [database[season] allKeys];
    
}

//Given season, holiday, and season-holiday-supply mapping, return list of supplies
- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database{
    
    return database[season][holiday];
}

//Return YES if given holiday is in season in season-holiday-supply mapping, NO otherwise
- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database{
    
    return [[self holidaysInSeason:season inDatabase:database] containsObject:holiday];
}

//Return YES if given supply is in given holiday/season in season-holiday-supply mapping, NO otherwise
- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database{
    
    return [[self suppliesInHoliday:holiday inSeason:season inDatabase:database] containsObject:supply];
}

//Add holiday as a new key for given season in season-holiday-supply mapping.
//Initialize supply list for new holiday as empty list.
//Does not overwrite existing key/value pair.
- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database{
    
    //Only add holiday if it doesn't already exist for that season
    if(![self holiday:holiday isInSeason:season inDatabase:database]){
        database[season][holiday] = [[NSMutableArray alloc] init];
    }
    
    return database;
}

//Add supply to list for given holiday/season in season-holiday-supply mapping.
//Does not create duplicate if supply already exists for that holiday/season.
- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database{
    
    //Only add supply if it's not already in the list for that holiday/season
    if(![self supply:supply isInHoliday:holiday inSeason:season inDatabase:database]){
        [database[season][holiday] addObject:supply];
    }
    
    return database;
}

@end