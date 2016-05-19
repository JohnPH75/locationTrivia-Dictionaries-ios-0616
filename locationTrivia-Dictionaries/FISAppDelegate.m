//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/** 
 
 *  Write your method implementations here.
 
 */

- (NSString*) stringByTruncatingNameOfLocation:(NSDictionary*)location toLength:(NSUInteger)length{
    
    NSString *beginningName = location[@"name"];
    
    //NSLog(@"***\n\n\nBEGINNING : %@", beginningName);
    
    if (length > beginningName.length) {
    
        return beginningName;
    }
    
    return [beginningName substringToIndex:length];
    
}

- (NSDictionary*) dictionaryForLocationWithName:(NSString*)name
                                       latitude:(CGFloat)latitude
                                      longitude:(CGFloat)longitude{

    
    NSDictionary *location =  @{ @"name"     : name      ,
                                 @"latitude" : @(latitude)  ,
                                 @"longitude": @(longitude) };
    
    return location;
    
}

- (NSArray*) namesOfLocations:(NSArray*)locations{
    
    NSMutableArray *locationNames = [[NSMutableArray alloc] init];
    
    for (NSDictionary *location in locations) {
    
        NSString *name = location[@"name"];
        
        [locationNames addObject:name];
    }
    
    return locationNames;
    
}

- (BOOL) dictionaryIsValidLocation:(NSDictionary*)dictionary{
    
    BOOL validLocation = NO;
    
    if (dictionary.count != 3) {
        
      validLocation = NO;
    
    }
        
    if ([[dictionary allKeys] containsObject:@"name"] && [[dictionary allKeys] containsObject:@"latitude"] && [[dictionary allKeys] containsObject:@"longitude"] && dictionary.count == 3){
        validLocation = YES;
    }
    
    
    
    
    return validLocation;
}

- (NSDictionary*) locationNamed:(NSString *)name inLocations:(NSArray *)locations{
    
    for (NSDictionary *locationNameKey in locations) {
        
        NSString *locationName = locationNameKey[@"name"];
        
        if ([locationName isEqualToString:name]) {
        
            return locationNameKey;
        }
    }
    
    return nil;
}

@end
