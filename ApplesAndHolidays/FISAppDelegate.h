//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//  FISAppDelegate.h


/**
 
 * Declare your methods here.
 
 */

// Apple Picker

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits;

// Holiday Supplies

- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database;

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database;

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database;

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database;

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database;

- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database;


@end
