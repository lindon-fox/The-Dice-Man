//
//  RollDefinition.h
//  TheDiceMan
//
//  Created by Johnny Grattan on 26/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RollDefinition : NSObject{
    int numberOfPossibilities;
}

+(RollDefinition *) rollDefinitionWithNumberOfPossibilities:(int)possibilities;

@property (nonatomic) int numberOfPossibilities;



- (NSString *) getDisplayName;



@end
