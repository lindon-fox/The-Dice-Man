//
//  RollDefinition.m
//  TheDiceMan
//
//  Created by Johnny Grattan on 26/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import "RollDefinition.h"

@interface RollDefinition(PrivateMethods)
-(id) initWithNumberOfPossibilities:(int)possibilities;
@end

@implementation RollDefinition

@synthesize numberOfPossibilities;

+(RollDefinition *) rollDefinitionWithNumberOfPossibilities:(int)possibilities{
    RollDefinition *rollDefinition = [[[RollDefinition alloc] initWithNumberOfPossibilities:possibilities] autorelease];
    return rollDefinition;
}

-(id) initWithNumberOfPossibilities:(int)possibilities
{
    self = [super init];
    if (self) {
        //setup
        self.numberOfPossibilities = possibilities;
    }
    return self;
}

-(id) init{
    self = [self initWithNumberOfPossibilities:2];
    if (self) {
    }
    return self;
}

-(void)setNumberOfPossibilities:(int)value
{
    NSAssert(value > 1, @"You need at least two possibilities");
    numberOfPossibilities = value;
}

+(NSString *) getDefaultNameForOption:(int)option{
    NSString *optionName = nil;
    if (option == 2) {
        optionName = @"50-50";
    }
    optionName = [NSString stringWithFormat:@"one in %d", option];
    
    return optionName;
}

-(NSString *) getDisplayName{
    return [RollDefinition getDefaultNameForOption:numberOfPossibilities];
}

- (NSString *) getDisplayNameForOption:(int)option
{
    DBLog(@"option %d from number of possibilities: %d", option, numberOfPossibilities);
    NSAssert(option >= 0, @"Option should be greater than or equal to 0");
    NSAssert(option < numberOfPossibilities, @"You should not be asking for an option greater than or equal to the number of possibilities");
    return [NSString stringWithFormat:@"Option %d", option + 1];
}

@end
