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





/* TASK
 Look at the HolidayTests file to review the structure of the suppliesByHolidayAndSeason dictionary at the top of the file. This dictionary is submitted to the database argument of the method calls across the test file, meaning that it's the collection you'll be working with. You should be able to decipher that this is a nested collection: the first layer is a static dictionary of "season" keys; each season key is bound to a mutable dictionary of "holiday" keys; each holiday key is bound to mutable array of "supplies" relevant to that holiday.
 */

/* -------------------------------------- */

/*holidaysInSeason:inDatabase: which takes two arguments, an NSString called season and an NSDictionary called database, and returns an NSArray.

holidaysInSeason:inDatabase: to return an array of all of the "holiday" keys in the sub-dictionary associated with the submitted "season" argument.
 
 
 
 NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche",
 @"Opel", @"Volkswagen", @"Audi"];
 
 NSPredicate *beforeL = [NSPredicate predicateWithBlock:
 ^BOOL(id evaluatedObject, NSDictionary *bindings) {
 NSComparisonResult result = [@"L" compare:evaluatedObject];
 if (result == NSOrderedDescending) {
 return YES;
 } else {
 return NO;
 }
 }];
 NSArray *makesBeforeL = [germanMakes
 filteredArrayUsingPredicate:beforeL];
 NSLog(@"%@", makesBeforeL);    // BMW, Audi

 
 
 */
-(NSArray *)holidaysInSeason : (NSString *)season
                  inDatabase : (NSDictionary *)database{
    return [database[season] allKeys];
}

/*suppliesInHoliday:inSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSArray.

 suppliesInHoliday:inSeason:inDatabase: to return the mutable array of all of the supplies for the submitted "holiday" in the submitted "season".
 */

-(NSArray *)suppliesInHoliday : (NSString *)holiday
                     inSeason : (NSString *)season
                   inDatabase : (NSDictionary *)database{
    return [NSArray arrayWithArray:database[season][holiday]];

}

/*holiday:isInSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns a BOOL.

 holiday:isInSeason:inDatabase: to return whether or not the submitted "season" contains a key that matches the "holiday" argument.

 */
-(BOOL)holiday : (NSString *)holiday
    isInSeason : (NSString *)season
    inDatabase : (NSDictionary *)database{
return [[database[season] allKeys] containsObject:holiday];
}
    //    (BOOL)holiday;
//    NSArray *holidaysInSeason = [database[season] allKeys];
//    for (NSString *day in holidaysInSeason) {
//        if ([day isEqualToString:holiday]) {
//            (holiday);
//        }
//        else{
//            holiday = false;
//        }
//        return holiday;
//    }
/*supply:isInHoliday:inSeason:inDatabase: which takes four arguments: an NSString called supply, an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns a BOOL.
 
 supply:isInHoliday:inSeason:inDatabase: to return whether or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string.
 
 

 */
-(BOOL)supply : (NSString *)supply
  isInHoliday : (NSString *)holiday
     inSeason : (NSString *)season
   inDatabase : (NSDictionary *)database{
    //Will look through the database to look in the seasons to look in holidays, to see if the specific holiday contains the given supply.
    //containsObject will return a BOOL type, which is why it works. 
       return [database[season][holiday] containsObject:supply];
}

/*addHoliday:toSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSDictionary.
 
 addHoliday:toSeason:inDatabase: to create a new key-value pair in the submitted "season" key's sub-dictionary that uses the submitted "holiday" as the key and sets up an empty mutable array as its value.

 */
-(NSDictionary *)addHoliday : (NSString *)holiday
                   toSeason : (NSString *)season
                 inDatabase : (NSDictionary *) database{
    return nil;

}

/*addSupply:toHoliday:inSeason:inDatabase: which takes four arguments: an NSString called supply, an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSDictionary.
  
 addSupply:toHoliday:inSeason:inDatabase: to insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.
 */
-(NSDictionary *)addSupply : (NSString *)supply
                 toHoliday : (NSString *)holiday
                  inSeason : (NSString *)season
                inDatabase : (NSDictionary *)database{
    return nil;

}


@end