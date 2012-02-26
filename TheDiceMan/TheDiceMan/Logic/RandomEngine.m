//
//  RandomEngine.m
//  TheDiceMan
//
//  Created by Johnny Grattan on 26/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//
#include <stdlib.h>
#import "RandomEngine.h"
#import "RollDefinition.h"

@implementation RandomEngine

+(int)rollWithRollDefinition:(RollDefinition *)rollDefinition{
    int answer = arc4random() % rollDefinition.numberOfPossibilities;
    DBLog(@"Roll: %d", answer);
    return answer;
}
@end
