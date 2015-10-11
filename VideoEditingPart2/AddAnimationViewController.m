//
//  AddAnimationViewController.m
//  VideoEditingPart2
//
//  Created by Abdul Azeem Khan on 1/24/13.
//  Copyright (c) 2013 com.datainvent. All rights reserved.
//

#import "AddAnimationViewController.h"

@interface AddAnimationViewController () <UITextFieldDelegate>

@end

@implementation AddAnimationViewController

- (IBAction)loadAsset:(id)sender {
    [self startMediaBrowserFromViewController:self usingDelegate:self];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(savedVideoOK) name:@"SAVED_VIDEO" object:nil];

}

-(void)savedVideoOK
{
     _uiActivityIndi.alpha = 0.0f;
}

- (IBAction)generateOutput:(id)sender
{
    
  [self videoOutput];
    
    _uiActivityIndi.alpha = 1.0f;
    
    
    double delayInSeconds = 6.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //code to be executed on the main queue after delay
        
       

    });
}

- (void)applyVideoEffectsToComposition:(AVMutableVideoComposition *)composition size:(CGSize)size
{
    // 1
  UIImage *bannerImage = [UIImage imageNamed:@"banner_bck"];;
    
    UIImage *author = [UIImage imageNamed:@"stive.jpg"];;

    
    
    
  CALayer *overlayLayer1 = [CALayer layer];
  [overlayLayer1 setContents:(id)[author CGImage]];
  overlayLayer1.frame = CGRectMake(size.width-64, size.height - 64, 64, 64);
  [overlayLayer1 setMasksToBounds:YES];
 
  CALayer *overlayLayer2 = [CALayer layer];
  [overlayLayer2 setContents:(id)[bannerImage CGImage]];
  overlayLayer2.frame = CGRectMake(size.width/2-64, size.height/2 - 530, 412, 86);
  [overlayLayer2 setMasksToBounds:YES];
    
    
    
    CATextLayer *subtitle1Text = [[CATextLayer alloc] init];
    [subtitle1Text setFont:@"Helvetica-Bold"];
    [subtitle1Text setFontSize:56];
    [subtitle1Text setFrame:CGRectMake(size.width/2-64, size.height/2 - 530,  412, 86)];
    [subtitle1Text setString:APPDATA.bannerCustomText];
    [subtitle1Text setAlignmentMode:kCAAlignmentCenter];
    [subtitle1Text setForegroundColor:[[UIColor blackColor] CGColor]];
    

    
    CATextLayer *authorName = [[CATextLayer alloc] init];
    [authorName setFont:@"Helvetica-Bold"];
    [authorName setFontSize:10];
    [authorName setFrame:CGRectMake(size.width-64, size.height - 64 - 64, 64, 64)];
    [authorName setString:@"סטיבן ספילברג"];
    [authorName setAlignmentMode:kCAAlignmentCenter];
    [authorName setForegroundColor:[[UIColor blackColor] CGColor]];

    
    
    
 
  if(_animationSelectSegment.selectedSegmentIndex == 0) {
    CABasicAnimation *animation =
    [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration=0.5;
    animation.repeatCount=10;
    animation.autoreverses=YES;
    // animate from half size to full size
    animation.fromValue=[NSNumber numberWithFloat:0.5];
    animation.toValue=[NSNumber numberWithFloat:1.0];
    animation.beginTime = AVCoreAnimationBeginTimeAtZero;
   // [overlayLayer1 addAnimation:animation forKey:@"scale"];
 
    animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration=1.0;
    animation.repeatCount=5;
    animation.autoreverses=YES;
    // animate from half size to full size
    animation.fromValue=[NSNumber numberWithFloat:0.5];
    animation.toValue=[NSNumber numberWithFloat:1.0];
    animation.beginTime = AVCoreAnimationBeginTimeAtZero;
   // [overlayLayer2 addAnimation:animation forKey:@"scale"];
      
      
      
      
      CABasicAnimation *theAnimation;
      theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
      theAnimation.duration=6;
      theAnimation.repeatCount=10;
      theAnimation.autoreverses=YES;
      theAnimation.fillMode = kCAFillModeForwards;
    theAnimation.removedOnCompletion = NO;
      
      theAnimation.beginTime = AVCoreAnimationBeginTimeAtZero;

//      theAnimation.fromValue=[NSNumber numberWithFloat:0];
//      theAnimation.toValue=[NSNumber numberWithFloat:80];
      theAnimation.byValue = [NSNumber numberWithFloat:1200];
      
      [overlayLayer2 addAnimation:theAnimation forKey:@"animateLayer"];
      [subtitle1Text addAnimation:theAnimation forKey:@"animateLayer"];

      
      
  }
 
  // 5
  CALayer *parentLayer = [CALayer layer];
  CALayer *videoLayer = [CALayer layer];
  parentLayer.frame = CGRectMake(0, 0, size.width, size.height);
  videoLayer.frame = CGRectMake(0, 0, size.width, size.height);
  [parentLayer addSublayer:videoLayer];
  [parentLayer addSublayer:overlayLayer1];
  [parentLayer addSublayer:overlayLayer2];
    [parentLayer addSublayer:subtitle1Text];
    [parentLayer addSublayer:authorName];

    
    //
 
  composition.animationTool = [AVVideoCompositionCoreAnimationTool
                               videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer:videoLayer inLayer:parentLayer];
}


#pragma mark TEXTFIELD DELEGATE

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    APPDATA.bannerCustomText = textField.text;
    [self.view endEditing:YES];
    
    return YES;
}


@end
