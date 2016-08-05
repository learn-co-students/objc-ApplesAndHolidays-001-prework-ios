//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//Given array of fruits, filter and return just the occurrences of 'apple'
- (NSArray *)pickApplesFromFruits:(NSArray *)fruits;

//Given season and season-holiday-supply mapping, return list of holidays in season
- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database;

//Given season, holiday, and season-holiday-supply mapping, return list of supplies
- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database;

//Return YES if given holiday is in season in season-holiday-supply mapping, NO otherwise
- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database;

//Return YES if given supply is in given holiday/season in season-holiday-supply mapping, NO otherwise
- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database;

//Add holiday as a new key for given season in season-holiday-supply mapping.
//Initialize supply list for new holiday as empty list.
//Does not overwrite existing key/value pair.
- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database;

//Add supply to list for given holiday/season in season-holiday-supply mapping.
//Does not create duplicate if supply already exists for that holiday/season.
- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database;
@end
