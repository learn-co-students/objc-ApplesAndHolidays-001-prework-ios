//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSDictionary *test = @{ @"Winter" : [@{ @"Christmas Day"    : [@[ @"plastic tree"   ,
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
    
    [self addSupply:@"xxx" toHoliday:@"Labor Day" inSeason:@"Summer" inDatabase:test];
    
    
    return YES;
}

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    NSPredicate *appledPredicate = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    NSArray *numberOfApplesInArray = [fruits filteredArrayUsingPredicate:appledPredicate];
    return numberOfApplesInArray;
}

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *mholidaysInSeason = [[NSMutableArray alloc]init];
    
    //NSLog(@"Holidays in winter: %@", database[@"Winter"]); //adds holiday and supplies. want just holiday.
    //NSPredicate *seasonInDataPred = [NSPredicate predicateWithFormat:@"self CONTAINS[c] %@", season]; //don't need predicate here
    //NSArray *holidaysInSeason2 = [[database allKeys] filteredArrayUsingPredicate:seasonInDataPred];
    
    for (NSDictionary *key in database[season]) {
        [mholidaysInSeason addObject:key];
    }
    //NSLog(@"result of predicate: %@", holidaysInSeason2); //returns only winter
    NSLog(@"result of for loop: %@", mholidaysInSeason);
    return mholidaysInSeason;
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *mSuppliesInHoliday = [[NSMutableArray alloc]init];
    for (NSString *supply in database[season][holiday]) {
        [mSuppliesInHoliday addObject:supply];
    }
    return mSuppliesInHoliday;
}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSPredicate *holidayInSeasonPredicate = [NSPredicate predicateWithFormat:@"self CONTAINS[c] %@", holiday];
    BOOL holidayisInSeason =[[database[season] allKeys] filteredArrayUsingPredicate:holidayInSeasonPredicate].count;
    NSLog(@"%d", holidayisInSeason);
    
    //NSLog(@"one or zero in array; %lu", [checkForKeys count]);
    /*
    for (NSString *holidayKey in database[season]) {
        if ([holidayKey isEqualToString:holiday] ) {
            NSLog(@"YES");
            return YES;
        }
    }
    */
    //NSArray *seasonWithHolidayArray = [[database allKeys]] filteredArrayUsingPredicate:holidayInSeasonPredicate];
    //BOOL seasonWithHoliday = [[database allKeys] filteredArrayUsingPredicate:holidayInSeasonPredicate].count;
    //NSLog(@"%@", seasonWithHolidayArray);
    //NSLog(@"%d", seasonWithHoliday);
    //NSLog(@"NO");
    return holidayisInSeason;
}

-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSPredicate *haveSupplyPredicate = [NSPredicate predicateWithFormat:@"self CONTAINS[c] %@", supply];
    BOOL haveSupply = [[database[season][holiday] filteredArrayUsingPredicate:haveSupplyPredicate] count];
    
    return haveSupply;
}

-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *emtpyMutableArray = [[NSMutableArray alloc]init];
    database[season][holiday] = emtpyMutableArray;

    return database;
}

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    [database[season][holiday] addObject:supply];
   
    return database;
}


@end