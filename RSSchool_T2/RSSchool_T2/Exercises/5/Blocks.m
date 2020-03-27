#import "Blocks.h"

@implementation Blocks
NSArray *enterArray;
-(BlockA)blockA {
    self.blockA = ^(NSArray *array) {
        enterArray = array;
    };
    return _blockA;
}

-(BlockB)blockB {
    Blocks *block = self;
    
    self.blockB = ^(Class class) {
        Blocks * classBlock= block;
        
        NSObject *results = nil;
        if (class == [NSNumber class]) {
            int sum = 0;
            for (int i = 0; i < [enterArray count]; i++) {
                id value = [enterArray objectAtIndex:i];
                if ([value isKindOfClass:[NSNumber class]]) {
                    sum = sum + [value intValue];
                }
            }
            results = [NSNumber numberWithInt:sum];
        }
        
        if (class == [NSString class]) {
            NSString *str = [[NSString alloc]init];
            for (int i = 0; i < [enterArray count]; i++) {
                id string = [enterArray objectAtIndex:i];
                if ([string isKindOfClass:[NSString class]]) {
                    str = [str stringByAppendingString:string];
                }
            }
            results = str;
        }
        
        if (class == [NSDate class]) {
            NSDate *date = nil;
            for (int i = 0; i < [enterArray count]; i++) {
                id obj = [enterArray objectAtIndex:i];
                if ([obj isKindOfClass:[NSDate class]]) {
                    if (date) {
                        if ([date compare:obj] == NSOrderedAscending) {
                            date = obj;
                        }
                    } else {
                        date = obj;
                    }
                }
            }
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"dd.MM.yyyy"];
            results = [formatter stringFromDate:date];
        }
        
        classBlock.blockC(results);
    };
    return _blockB;
}

@end

