//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

//pickApplesFromFruits: which takes one NSArray argument fruits and returns an NSArray.
/*TASK**
 Write out the implementation body for the pickApplesFromFruits: method so that it returns an NSArray of all of the occurrences of the string @"apple" in the argument array fruits. Think about how you can filter the argument array using NSPredicate.
 
     NSPredicate *inPredicate =
     [NSPredicate predicateWithFormat: @"attribute IN %@", aCollection]; 
    }
 */

-(NSArray *)pickApplesFromFruits : (NSArray *)fruits{
    NSMutableArray *pickApplesFromFruits = [[NSMutableArray alloc] init];
    NSString *apple = @"apple";
    for (NSString *fruit in fruits) {
        if ([fruit isEqualToString: apple]){
            [pickApplesFromFruits addObject:apple];
        }
    }
    
    return [NSArray arrayWithArray:pickApplesFromFruits];
    
}

/* -------------------------------------- */


//holidaysInSeason:inDatabase: which takes two arguments, an NSString called season and an NSDictionary called database, and returns an NSArray.

/* TASK
 
 
 */
-(NSArray *)holidaysInSeason : (NSString *)season
                  inDatabase : (NSDictionary *)database{
    return nil;

}

//suppliesInHoliday:inSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSArray.
-(NSArray *)suppliesInHoliday : (NSString *)holiday
                     inSeason : (NSString *)season
                   inDatabase : (NSDictionary *)database{
    return nil;

}

//holiday:isInSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns a BOOL.
-(BOOL)holiday : (NSString *)holiday
    isInSeason : (NSString *)season
    inDatabase : (NSDictionary *)database{
    return YES;

}

//supply:isInHoliday:inSeason:inDatabase: which takes four arguments: an NSString called supply, an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns a BOOL.
-(BOOL)supply : (NSString *)supply
  isInHoliday : (NSString *)holiday
     inSeason : (NSString *)season
   inDatabase : (NSDictionary *)database{
    return YES;
}

//addHoliday:toSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSDictionary.
-(NSDictionary *)addHoliday : (NSString *)holiday
                   toSeason : (NSString *)season
                 inDatabase : (NSDictionary *) database{
    return nil;

}

//addSupply:toHoliday:inSeason:inDatabase: which takes four arguments: an NSString called supply, an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSDictionary.
-(NSDictionary *)addSupply : (NSString *)supply
                 toHoliday : (NSString *)holiday
                  inSeason : (NSString *)season
                inDatabase : (NSDictionary *)database{
    return nil;

}


@end