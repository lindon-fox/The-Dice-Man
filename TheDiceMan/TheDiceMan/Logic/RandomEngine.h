//
//  RandomEngine.h
//  TheDiceMan
//
//  Created by Johnny Grattan on 26/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RollDefinition;
@interface RandomEngine : NSObject
+(int)rollWithRollDefinition:(RollDefinition *)rollDefinition;
@end
