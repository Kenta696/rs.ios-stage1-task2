#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    int hoursAsNumber;
    int minutesAsNumber;
    NSMutableString* transferString = [[NSMutableString alloc]init];
    NSScanner* scanerForHours = [NSScanner scannerWithString:hours];
    [scanerForHours scanInt:&hoursAsNumber];
    NSScanner* scanerForMinutes = [NSScanner scannerWithString:minutes];
    [scanerForMinutes scanInt:&minutesAsNumber];
    NSArray* arrayWithHours =@[@"one",@"two",@"three",@"four",
                               @"five",@"six",@"seven",@"eight",
                               @"nine",@"ten",@"eleven",@"twelve"];
    NSArray*arrayWithMinutes =@[@"one",@"two",@"three",@"four",
                                @"five",@"six",@"seven",@"eight",
                                @"nine",@"ten",@"eleven",@"twelve",@"thirteen",
                                @"fourteen",@"quarter",@"sixteen",
                                @"seventeen",@"eighteen",@"nineteen",@"twenty",
                                @"twenty one",@"twenty two",@"twenty three",
                                @"twenty four",@"twenty five",@"twenty six",
                                @"twenty seven",@"twenty eight",@"twenty nine",
                                @"half",@"twenty nine",@"twenty eight",@"twenty seven",@"twenty six",
                                @"twenty five",@"twenty four",@"twenty three",@"twenty two",@"twenty one",
                                @"twenty",@"nineteen",@"eighteen",@"seventeen",@"sixteen",@"quarter",
                                @"fourteen",@"thirteen",@"twelve",@"eleven",@"ten",@"nine",@"eight",
                                @"seven",@"six",@"five",@"four",@"three",@"two",@"one"];
    if (minutesAsNumber == 0) {
        [transferString appendString:[arrayWithHours objectAtIndex:hoursAsNumber-1]];
        [transferString appendString: @" "];
        [transferString appendString:@"o' clock"];
    }else if (minutesAsNumber<30 && minutesAsNumber !=15 ) {
        [transferString appendString:[arrayWithMinutes objectAtIndex:minutesAsNumber -1]];
        [transferString appendString: @" "];
        [transferString appendString:@"minutes"];
        [transferString appendString: @" "];
        [transferString appendString:@"past"];
        [transferString appendString: @" "];
        [transferString appendString:[arrayWithHours objectAtIndex:hoursAsNumber -1]];
    } else if (minutesAsNumber >=31 && minutesAsNumber <=59 && minutesAsNumber!= 45){
        [transferString appendString:[arrayWithMinutes objectAtIndex:minutesAsNumber -1]];
        [transferString appendString: @" "];
        [transferString appendString:@"minutes"];
        [transferString appendString: @" "];
        [transferString appendString:@"to"];
        [transferString appendString: @" "];
        [transferString appendString:[arrayWithHours objectAtIndex:hoursAsNumber]];
    }else if (minutesAsNumber == 15 ) {
        [transferString appendString:[arrayWithMinutes objectAtIndex:minutesAsNumber -1]];
        [transferString appendString: @" "];
        [transferString appendString:@"past"];
        [transferString appendString: @" "];
        [transferString appendString:[arrayWithHours objectAtIndex:hoursAsNumber -1]];
    }else if (minutesAsNumber == 45){
        [transferString appendString:[arrayWithMinutes objectAtIndex:minutesAsNumber -1]];
        [transferString appendString: @" "];
        [transferString appendString:@"to"];
        [transferString appendString: @" "];
        [transferString appendString:[arrayWithHours objectAtIndex:hoursAsNumber]];
    }else if (minutesAsNumber == 30) {
        [transferString appendString:[arrayWithMinutes objectAtIndex:minutesAsNumber -1]];
        [transferString appendString: @" "];
        [transferString appendString:@"past"];
        [transferString appendString: @" "];
        [transferString appendString:[arrayWithHours objectAtIndex:hoursAsNumber-1]];
    } else if (minutesAsNumber<60) {
        [transferString appendString:@"@"];
    }
    
    NSString*results = [NSString stringWithString:transferString];
    
    return results;
}
@end
