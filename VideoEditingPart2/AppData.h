//
//  AppData.h
//  VideoEditingPart2
//
//  Created by BiGapps Interactive on 9/3/15.
//  Copyright (c) 2015 com.datainvent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppData : NSObject
@property (weak, nonatomic)  UIView *appDataViewBanner;
@property (weak, nonatomic)  UIView *appDataViewNameAndPic;

@property (strong, nonatomic) NSURL* appDataURL;

@property (weak, nonatomic)  UILabel *appDataLblBannerText;

@property (weak, nonatomic)  UIImageView *appDataIvBannerImage;

@property (strong, nonatomic)  NSString * bannerCustomText;


@property(nonatomic) BOOL hasVideo;

//Singletone
+(AppData*)sharedInstance;



@end
