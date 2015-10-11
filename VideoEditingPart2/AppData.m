//
//  AppData.m
//  VideoEditingPart2
//
//  Created by BiGapps Interactive on 9/3/15.
//  Copyright (c) 2015 com.datainvent. All rights reserved.
//

#import "AppData.h"
static AppData* staticInstance;

@implementation AppData


+(AppData*)sharedInstance
{
    if (staticInstance==nil)
    {
        staticInstance=[AppData new];
     
    }
    return staticInstance;
}

@end
