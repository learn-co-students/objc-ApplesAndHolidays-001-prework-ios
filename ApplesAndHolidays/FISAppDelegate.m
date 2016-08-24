//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    
    NSDictionary *suppliesBySeasonAndHoliday =
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
    
    
    NSArray *fruitsFiveApples = @[ @"apple" ,
                                  @"orange",
                                  @"apple" ,
                                  @"pear"  ,
                                  @"apple" ,
                                  @"apple" ,
                                  @"peach" ,
                                  @"apple" ];
    
    // use pickApplesFromFruits
    NSArray *results1 =  [[NSArray alloc] init];
    results1 = [self pickApplesFromFruits:fruitsFiveApples];
    NSLog(@"pickApplesFromFruits: %@", results1);
    
    // use holidaysInSeason
    NSArray *results2 =  [[NSArray alloc] init];
    results2 = [self holidaysInSeason:@"Summer" inDatabase:suppliesBySeasonAndHoliday];
    NSLog(@"holidaysInSeason: %@", results2);
    
    // use suppliesInHoliday
    NSArray *results3 =  [[NSArray alloc] init];
    results3 = [self suppliesInHoliday:@"Christmas Day"  inSeason:@"Winter" inDatabase:suppliesBySeasonAndHoliday];
    NSLog(@"suppliesInHoliday: %@", results3);
    
    // use holiday
    BOOL results4 = [self holiday:@"Christmas Day"  isInSeason:@"Winter" inDatabase:suppliesBySeasonAndHoliday];
    NSLog(@"holiday: %d", results4);
    
    // use supply
    BOOL results5 =[self supply:@"lights" isInHoliday:@"Christmas Day" inSeason:@"Winter" inDatabase:suppliesBySeasonAndHoliday];
    NSLog(@"holiday: %d", results5);
    
    // use addHoliday
    NSDictionary *results6 = [self addHoliday:@"**New Holiday**" toSeason:@"Winter" inDatabase:suppliesBySeasonAndHoliday];
    NSLog(@"addHoliday: %@", results6);
    
    // use add supply
    NSDictionary *results7 = [self addSupply:@"pepper" toHoliday:@"Christmas Day" inSeason:@"Winter" inDatabase:suppliesBySeasonAndHoliday];
    NSLog(@"addHoliday: %@", results7);
    
    
    return YES;
}

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits{
    NSString *match = @"apple";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", match];
    NSArray *results = [fruits filteredArrayUsingPredicate:predicate];
    return results;
}

- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSArray *results = [database[season] allKeys];
    return results;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSArray *results = database[season][holiday];
    return results;
}

- (BOOL) holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    BOOL results = false;
    NSPredicate *findHolidayInSeason = [NSPredicate predicateWithFormat:@"SELF == %@", holiday];
    NSArray *holidayNameFound = [[database[season] allKeys] filteredArrayUsingPredicate:findHolidayInSeason];
    if([holidayNameFound count] > 0){
        results = true;
    }
    return results;
}

- (BOOL) supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    BOOL results = false;
    NSPredicate *findSupplyInHolidaySeason = [NSPredicate predicateWithFormat:@"SELF == %@", supply];
    NSArray *supplyNameFound = [database[season][holiday] filteredArrayUsingPredicate:findSupplyInHolidaySeason];
    if([supplyNameFound count] > 0){
        results = true;
    }
    return results;
}

- (NSDictionary *) addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    database[season][holiday] = [[NSMutableArray alloc] init];
    return database;
}

- (NSDictionary *) addSupply: (NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    [database[season][holiday] addObject:supply];
    return database;
}



@end