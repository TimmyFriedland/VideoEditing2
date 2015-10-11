//
//  OverlayViewController.h
//  VideoEditingPart2
//
//  Created by BiGapps Interactive on 9/3/15.
//  Copyright (c) 2015 com.datainvent. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol overDelegate <NSObject>
- (void)sendShouldStartFilmong;
- (void)sendShouldStopFilmong;


-(NSString*)testToast;

@end
@interface OverlayViewController : UIViewController
- (IBAction)btnStartStopTapped:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnStartStop;
@property (weak, nonatomic) id<overDelegate> delegate;

@property (nonatomic, strong) id <overDelegate> sampleDelegateObject;
@property (nonatomic)BOOL filming;
@property (weak, nonatomic) IBOutlet UIView *viewBanner;
@property (weak, nonatomic) IBOutlet UIView *viewNameAndPic;
@property (weak, nonatomic) IBOutlet UILabel *lblBannerText;
@property (weak, nonatomic) IBOutlet UIImageView *ivBannerImage;
@property (weak, nonatomic) IBOutlet UIView *testView;

@end
