//
//  OverlayViewController.m
//  VideoEditingPart2
//
//  Created by BiGapps Interactive on 9/3/15.
//  Copyright (c) 2015 com.datainvent. All rights reserved.
//

#import "OverlayViewController.h"
#import "Toast+UIView.h"
@interface OverlayViewController () 

@end

@implementation OverlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   // _btnStartStop.titleLabel.text = @"Start";
    
    
    _viewNameAndPic.transform = CGAffineTransformMakeRotation(M_PI_2);
    
   // [_viewNameAndPic setFrame:CGRectMake(_viewNameAndPic.frame.origin.x -_viewNameAndPic.frame.size.height, _viewNameAndPic.frame.origin.y, _viewNameAndPic.frame.size.width, _viewNameAndPic.frame.size.height)];
    
    if(SMALL_SCREEN)
    {
        
        [_btnStartStop setFrame:CGRectMake((_btnStartStop.frame.origin.x ) , SCREEN.size.height - 50 , _btnStartStop.frame.size.width, _btnStartStop.frame.size.height)];
        
        
 
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendShouldStartFilmong
{
    
    [[[UIApplication sharedApplication]keyWindow]makeToast:@"KOOL"];

   
}


- (void)sendShouldStopFilmong
{
    
    [[[UIApplication sharedApplication]keyWindow]makeToast:@"KOOL"];
    
    
}

-(NSString*)testToast
{
   
    return @"NO WAY IT WORKS";
}




- (IBAction)btnStartStopTapped:(UIButton *)sender
{
    UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    
    if( orientation == UIInterfaceOrientationLandscapeRight)
    {
    
    
    id<overDelegate> strongDelegate = self.delegate;
    if ([strongDelegate respondsToSelector:@selector(sendShouldStartFilmong)] || [strongDelegate respondsToSelector:@selector(sendShouldStopFilmong)])
   {
    
        
        //[strongDelegate testToast];

    }
    


    if(_filming)
    {
        [strongDelegate sendShouldStopFilmong];

        
       // _btnStartStop.titleLabel.text = @"Start";
         _filming = NO;
    }
    else
    {
        

        [strongDelegate sendShouldStartFilmong];
        _filming = YES;
    }
    }
    
}
@end
