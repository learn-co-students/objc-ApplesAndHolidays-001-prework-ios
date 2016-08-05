#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISAppDelegate.h"


SpecBegin(ApplesTests)

__block FISAppDelegate *appDelegate;

__block NSArray *fruitsNoApples;
__block NSArray *fruitsOneApple;
__block NSArray *fruitsFiveApples;

__block NSArray *oneApple;
__block NSArray *fiveApples;

describe(@"ApplesSpec", ^{
    
    beforeEach(^{
        appDelegate = [[FISAppDelegate alloc] init];
        
        fruitsNoApples = @[ @"orange",
                            @"pear"  ,
                            @"kiwi"  ];
        
        fruitsOneApple = @[  @"apple"  ,
                             @"orange",
                             @"pear"  ];
        
        fruitsFiveApples = @[ @"apple" ,
                              @"orange",
                              @"apple" ,
                              @"pear"  ,
                              @"apple" ,
                              @"apple" ,
                              @"peach" ,
                              @"apple" ];
        
        oneApple = @[ @"apple" ];
        
        fiveApples = @[ @"apple" ,
                        @"apple" ,
                        @"apple" ,
                        @"apple" ,
                        @"apple" ];
    });
    
    describe(@"pickApplesFromFruits", ^{
        it(@"returns an NSArray object", ^{
            expect([appDelegate pickApplesFromFruits:oneApple]).to.beKindOf([NSArray class]);
        });
        
        it(@"returns an empty array when no apples are found", ^{
            expect([appDelegate pickApplesFromFruits:fruitsNoApples]).to.haveCountOf(0);
        });
        
        it(@"returns an array with one apple from an array mixed with one apple", ^{
            expect([appDelegate pickApplesFromFruits:fruitsOneApple]).to.beSupersetOf(oneApple);
            expect([appDelegate pickApplesFromFruits:fruitsOneApple]).to.haveCountOf(1);
        });
        
        it(@"returns an array with five apples from an array mixed with five apples", ^{
            expect([appDelegate pickApplesFromFruits:fruitsFiveApples]).to.beSupersetOf(fiveApples);
            expect([appDelegate pickApplesFromFruits:fruitsFiveApples]).to.haveCountOf(5);
        });
    });
});


SpecEnd

