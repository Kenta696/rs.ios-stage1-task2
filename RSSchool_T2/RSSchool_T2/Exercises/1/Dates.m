#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSMutableString* string = [[NSMutableString alloc]init];
    NSInteger numberDay, numberMonth, numberYear;
    NSScanner* scanerDay = [NSScanner scannerWithString:day];
    NSScanner* scanerMonth = [NSScanner scannerWithString:month];
    NSScanner* scanerYear = [NSScanner scannerWithString:year];
    [scanerDay scanInteger:&numberDay];
    [scanerMonth scanInteger:&numberMonth];
    [scanerYear scanInteger:&numberYear];
    NSDateComponents* dataSet= [[NSDateComponents alloc]init];
    [dataSet setDay:numberDay];
    [dataSet setMonth:numberMonth];
    [dataSet setYear:numberYear];
    NSArray* arrayWithMonth = [NSArray arrayWithObjects:@"января,",@"феараля,",@"марта,",@"апреля,",@"мая,",
                               @"июня,",@"июля,",@"августа,",@"сентября,",
                               @"октября,",@"ноября,",@"декабря,",nil];
    NSArray* arrayWithDay = [NSArray arrayWithObjects:@"воскресенье",@"понедельник",@"вторник",
                             @"среда",@"четверг",@"пятница",@"суббота", nil];
    NSInteger dayOfWeek = [dataSet weekday];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDate* data = [calendar dateFromComponents:dataSet];
    [calendar getEra:NULL yearForWeekOfYear:NULL weekOfYear:NULL weekday:&dayOfWeek fromDate:data];
    if (numberMonth==2 && numberDay<=28) {
        NSString* stringWithDay = [arrayWithDay objectAtIndex:dayOfWeek-1];
        NSString* stringWithMonth = [arrayWithMonth objectAtIndex:numberMonth-1];
        [string appendString:day];
        [string appendString:@" "];
        [string appendString:stringWithMonth];
        [string appendString:@" "];
        [string appendString:stringWithDay];
    }
    if (numberMonth<=12 && numberDay <=31 && numberMonth!=2 ) {
        NSString* stringWithDay = [arrayWithDay objectAtIndex:dayOfWeek-1];
        NSString* stringWithMonth = [arrayWithMonth objectAtIndex:numberMonth-1];
        [string appendString:day];
        [string appendString:@" "];
        [string appendString:stringWithMonth];
        [string appendString:@" "];
        [string appendString:stringWithDay];

    }else {
        NSString* stringWithouDate =@"Такого дня не существует";
        [string appendString:stringWithouDate];
    }
        NSString* reults = [NSString stringWithString:string];
    return reults;
}

@end
