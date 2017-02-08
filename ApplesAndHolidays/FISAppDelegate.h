//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */

// returns an NSArray of all of the occurrences of the string @"apple" in the argument array fruits. Think about how you can filter the argument array using NSPredicate.
- (NSArray *)pickApplesFromFruits: (NSArray *)fruits;

// to return an array of all of the "holiday" keys in the sub-dictionary associated with the submitted "season" argument.
- (NSArray *)holidaysInSeason: (NSString *)season inDatabase: (NSDictionary *)database;

// to return the mutable array of all of the supplies for the submitted "holiday" in the submitted "season".
- (NSArray *)suppliesInHoliday: (NSString *)holiday inSeason: (NSString *)season inDatabase: (NSDictionary *)database;

// to return whether or not the submitted "season" contains a key that matches the "holiday" argument.
- (BOOL)holiday: (NSString*)holiday isInSeason: (NSString *)season inDatabase: (NSDictionary *)database;

// to return whether or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string.
- (BOOL)supply: (NSString *)supply isInHoliday: (NSString *)holiday inSeason: (NSString *)season inDatabase: (NSDictionary *)database;

// to create a new key-value pair in the submitted "season" key's sub-dictionary that uses the submitted "holiday" as the key and sets up an empty mutable array as its value.
- (NSDictionary *)addHoliday: (NSString *)holiday toSeason: (NSString *)season inDatabase: (NSDictionary *)database;

//  to insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.
- (NSDictionary *)addSupply: (NSString *)supply toHoliday: (NSString *)holiday inSeason: (NSString *)season inDatabase: (NSDictionary *)database;

@end
