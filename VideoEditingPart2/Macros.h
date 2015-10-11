//
//  Macros.h
//  Art Judaica
//
//  Created by BiGapps Interactive on 12/30/14.
//  Copyright (c) 2014 BiGapps2014. All rights reserved.
//

#ifndef Art_Judaica_Macros_h
#define Art_Judaica_Macros_h


#define mainGreen [UIColor colorWithRed:141/255.0 green:190/255.0 blue:81/255.0 alpha:1.0]
#define colorGrey [UIColor colorWithRed:172/255.0 green:171/255.0 blue:176/255.0 alpha:1.0]
#define colorLightGrey [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0]
#define RESPONSE_OK [jsonDict[keyDStatus] integerValue]==1
#define GENERALDATA [AppData sharedInstance].generalInfo
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SMALL_SCREEN ([UIScreen mainScreen].bounds.size.height < 500)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define IS_IPHONE_6PLUS (IS_IPHONE && [[UIScreen mainScreen] nativeScale] == 3.0f)
#define IS_IPHONE_6_PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0)

//#define MEDIUM_SCREEN ([UIScreen mainScreen].bounds.size.height < 500)

#define SCREEN [UIScreen mainScreen].bounds
#define APPDATA [AppData sharedInstance]

#define MYDELAYACTION

//double delayInSeconds = 2.0;
//dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//    //code to be executed on the main queue after delay
//    
//});

#define BTN_APPROVE DPLocalizedString(@"btn.approve", nil)
#define BTN_CANCEL DPLocalizedString(@"btn.cancel", nil)
#define BTN_SAVE_PIC DPLocalizedString(@"btn.savePic", nil)
#define BTN_ENLARGE DPLocalizedString(@"btn.enlargePic", nil)
#define BTN_ADD_TO_CART DPLocalizedString(@"btn.addToCart", nil)
#define FACTORY [PageFactory sharedInstance]
#define ALERT_ERROR [NSString autolocalizingStringWithLocalizationKey:@"error.fillDetails"]
#define USER_IS_GUEST !APPDATA.loggedIn

#define kOFFSET_FOR_KEYBOARD 80.0


//Block Macros
#define UPDATE_CART( product ) \
{\
JDProduct* prod = [[JDProduct alloc]init];\
prod.productDetails = [NSDictionary dictionaryWithDictionary:product];\
prod.qttyToBuy = amount;\
prod.minOrder = [product[keyDMinOrder] intValue];\
prod.productCode = product[keyDProductCode];\
[APPDATA updateCartWithProduct:prod];\
}

#define LEFT_MENU [FACTORY getLeftMenuVC]
#define RIGHT_MENU [FACTORY getRightMenuVC]

//#define NIMOLOG( string , myObject ) \
//{\
//[AppUtil starsLogWithText:string andObject:myObject];\
//}

#define NIMOLOG( string ) \
{\
    NSLog(@"\n********************\n%@\n********************\n",string);\
}

#define NIMOLOGVALUE( string , object ) \
{\
NSLog(@"\n********************\n%@ : %@\n********************\n",string, object);\
}

#define ADD_LOAD_MORE_BUTTON \
{\
UIView* loadMoreView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 45)];\
UIButton* loadButton = [[UIButton alloc]initWithFrame:loadMoreView.frame];\
[loadButton addTarget:self action:@selector(loadMoreProducts) forControlEvents:UIControlEventTouchUpInside];\
[loadButton setTitle:DPLocalizedString(@"btn.continue", nil) forState:UIControlStateNormal];\
loadButton.titleLabel.font = [AppUtil getFontWithSize:20];\
[loadButton setBackgroundColor:orangeAppColor];\
[loadMoreView addSubview:loadButton];\
[self.tableView setTableFooterView:loadMoreView];\
}


#define STATUS_BAR_HEIGHT [[UIApplication sharedApplication]statusBarFrame].size.height
#endif
