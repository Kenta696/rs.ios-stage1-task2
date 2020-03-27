#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSString* newString = [a uppercaseString];
    NSMutableString* results =[[NSMutableString alloc]init];
    NSRange searchNSRange = NSMakeRange(0,a.length);
    NSRange range = [newString rangeOfString:b options:0 range:searchNSRange];
    if (range.location!= NSNotFound) {
        [results appendString:@"YES"];
    }else if (range.location == NSNotFound)
        [results appendString:@"NO"];
    NSLog(@"%@",results);
    return results;
}
@end
