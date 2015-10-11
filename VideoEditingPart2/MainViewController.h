//
//  MainViewController.h
//  VideoEditingPart2
//
//  Created by BiGapps Interactive on 9/3/15.
//  Copyright (c) 2015 com.datainvent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OverlayViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MainViewController : UIViewController
- (IBAction)btnTakeVideoTapped:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnEditOut;
@property (strong, nonatomic) MPMoviePlayerController *player;
@property (strong, nonatomic) OverlayViewController* overlay;
@property (strong, nonatomic) UIImagePickerController* picker;
@end
