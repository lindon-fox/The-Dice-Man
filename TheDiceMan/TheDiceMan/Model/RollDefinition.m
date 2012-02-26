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
    NSAssert(value > 1, @"You need at least two possibilities@");
    numberOfPossibilities = value;
}

-(NSString *) getDisplayName{

    if (numberOfPossibilities == 2) {
        return @"50-50";
    }
    return [NSString stringWithFormat:@"one in %d", numberOfPossibilities];
}

@end
