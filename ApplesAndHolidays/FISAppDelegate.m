//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.


 
    NSDictionary * database  =
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

    
    [self addSupply:@"sunscreen" toHoliday:@"Veteran's Day" inSeason:@"Fall" inDatabase:database];
    NSLog(@"%@ SHOWTIME---",[self addSupply:@"sunscreen" toHoliday:@"Veteran's Day" inSeason:@"Fall" inDatabase:database]);
    
    return YES;

}


-(NSArray *)pickApplesFromFruits:(NSArray *)fruites{

    
    NSPredicate * appleSearch = [NSPredicate predicateWithFormat:@" SELF LIKE 'apple'"];
    NSArray * gotApple = [fruites filteredArrayUsingPredicate:appleSearch];
    
    NSLog(@"got apples %@", gotApple);
    
    return  gotApple ;
    
}


-(NSArray *)holidaysInSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database{
    
    NSDictionary * seasonDiction = [database objectForKey:season];
    NSArray * eachSeason = [ seasonDiction allKeys];
    
    return eachSeason;
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday
                     inSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database{
    
    NSDictionary * seasonDiction = [database objectForKey:season];
    NSArray * suppliesForHoliday = [[seasonDiction objectForKey:holiday] mutableCopy];
    
    return suppliesForHoliday;
}

-(BOOL)holiday:(NSString *)holiday
    isInSeason:(NSString *)season
    inDatabase:(NSDictionary *)database{
    
    NSDictionary * holidays = [database objectForKey:season];
    NSArray * holidayNames = [holidays allKeys];
    
    BOOL matchHoliday = [holidayNames containsObject:holiday];
    
    return matchHoliday;
}

-(BOOL)supply:(NSString *)supply
  isInHoliday:(NSString *)holiday
     inSeason:(NSString *)season
   inDatabase:(NSDictionary *)database{
    
    NSDictionary * holidays = [database objectForKey:season];
    NSArray * submitSupplyList = [holidays objectForKey:holiday];
    
    BOOL matchSupply = [ submitSupplyList containsObject:supply];
    
    return  matchSupply;
}

-(NSDictionary *)addHoliday:(NSString *)holiday
                   toSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database{
    
    NSMutableArray * holidayObjects = [[NSMutableArray alloc] init];
    NSDictionary * holidayD = @{ holiday : holidayObjects };
    NSDictionary * databaseAdd = @{ season : holidayD};
    
    NSMutableDictionary * databaseAll = [ database mutableCopy ];
    [databaseAll addEntriesFromDictionary: databaseAdd];
    
    return databaseAll;
}


-(NSDictionary *)addSupply:(NSString *)supply
                 toHoliday:(NSString *)holiday
                  inSeason:(NSString *)season
                inDatabase:(NSDictionary *)database{
    
    NSMutableDictionary * databaseAll = [database mutableCopy];

    
    NSMutableArray * addSupply = [[NSMutableArray alloc] init];
    
    addSupply = [[[database objectForKey:season] objectForKey:holiday] mutableCopy];
    
    [addSupply addObject:supply];

    //NSMutableDictionary * holidayNew = [NSMutableDictionary
                                      //  dictionaryWithDictionary: @{ holiday : addSupply }];
    //NSDictionary * databaseAdd = [[NSDictionary alloc] init];
    //databaseAdd = @{ season : holidayNew };

    [ [databaseAll objectForKey:season] setValue:addSupply forKey:holiday];

    return databaseAll;
    
}

@end



