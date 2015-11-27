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
    

    
//    NSDictionary *tester = suppliesBySeasonAndHoliday[@"Summer"];
    
//    NSLog(@"%@", tester);
    
    return YES;
}

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {

    NSPredicate *apples = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    
    NSArray *returnArray = [fruits filteredArrayUsingPredicate:apples];
    
    return returnArray;

}

- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *arrayOfHolidaysInSeason = [[NSMutableArray alloc] init];
    
    for (NSDictionary *testerDict in database[season]) {
        [arrayOfHolidaysInSeason addObject:testerDict];
    }
    
    NSArray *returnArray = [NSArray arrayWithArray:arrayOfHolidaysInSeason];
    
    return returnArray;
}


- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {

    // get the holidays from the previou method
//    NSArray *holidays = [self holidaysInSeason:holiday inDatabase:database];

    NSMutableArray *arrayOfSuppliers = [[NSMutableArray alloc] init];
    
    
    for (NSString *supplies in database[season][holiday]) {
        [arrayOfSuppliers addObject:supplies];
    }
    
    NSArray *returnArray = [NSArray arrayWithArray:arrayOfSuppliers];
    
    return returnArray;
}

- (BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    BOOL val = NO;
    
    NSArray *holidays = [self holidaysInSeason:season inDatabase:database];
    
    for (NSString *holidayCheck in holidays) {
        if ([holidayCheck isEqualToString:holiday]) {
            val = YES;
        }
    }
    
    return val;
    
}



- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    BOOL val = NO;
    
    NSArray *supplies = [self suppliesInHoliday:holiday inSeason:season inDatabase:database];
    
    for (NSString *supplyCheck in supplies) {
        if ([supplyCheck isEqualToString:supply]) {
            val = YES;
        }
    }
    
    return val;

    
    
    return nil;
}

- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {

    // create mutable sub dictionary from original dictionary and season
    NSMutableDictionary *baseDatabase = [NSMutableDictionary dictionaryWithDictionary:database[season]];
    
    // create new mutable dictionary with empty array and a holiday key

    
    NSMutableDictionary *databaseFromOriginal = [NSMutableDictionary dictionaryWithDictionary:database];
    
    baseDatabase[holiday] = @[];
    
    databaseFromOriginal[season] = baseDatabase;
    
    NSDictionary *returnDictionary = databaseFromOriginal;
//    NSLog(@"Old Dictionary\n %@", database);
//    NSLog(@"New dictionary\n%@", returnDictionary);
    
    
    return returnDictionary;
}


- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSArray *newSupplyArray = [self suppliesInHoliday:holiday inSeason:season inDatabase:database];
    
    NSMutableArray *mSupplyArray = [newSupplyArray mutableCopy];
    [mSupplyArray addObject:supply];
    
    
    NSMutableDictionary *newDatabase = [NSMutableDictionary dictionaryWithDictionary:database];
    
    newDatabase[season][holiday] = mSupplyArray;
    
//    NSLog(@"%@", newDatabase[season][holiday]);
    
    NSDictionary *returnDictionary = [NSDictionary dictionaryWithDictionary:newDatabase];
//    NSLog(@"%@", newDatabase);
    return returnDictionary;
}



@end