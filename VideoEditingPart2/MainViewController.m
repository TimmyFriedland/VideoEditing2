//
//  MainViewController.m
//  VideoEditingPart2
//
//  Created by BiGapps Interactive on 9/3/15.
//  Copyright (c) 2015 com.datainvent. All rights reserved.
//

#import "MainViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

#import "Toast+UIView.h"
@interface MainViewController () <overDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
   
    
    if(!APPDATA.hasVideo)
    {
        _btnEditOut.alpha = 0.0f;
    }
    
    else
    {
        _btnEditOut.alpha = 1.0f;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(UIView*)getCopyOfView:(UIView*)view
{
    id copyOfView =
    [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:view]];
    
    return copyOfView;
}





-(void)sendShouldStartFilmong
{
    UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];

    
    if( orientation == UIInterfaceOrientationLandscapeRight)
         {
        //
 
    
//    BRING THIS BACK!!!
    [_picker startVideoCapture];
    
    NSLog(@"JHKUHKHGKHKJHK");
    
   // [[[UIApplication sharedApplication]keyWindow]makeToast:@"STARTED"];
    


    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //code to be executed on the main queue after delay
        
        //_overlay.btnStartStop.alpha = 0.2f;
        _overlay.btnStartStop.imageView.image = [UIImage imageNamed:@"stop_rec"];

        NSString *path = [[NSBundle mainBundle] pathForResource:@"sampleVideo1" ofType:@"mp4"];
        NSURL *url = [NSURL fileURLWithPath:path];
        
       _player = [[MPMoviePlayerController alloc] initWithContentURL:url];
        
        _player.movieSourceType = MPMovieSourceTypeFile;

        _player.controlStyle = MPMovieControlStyleNone;
        
        if(SMALL_SCREEN)
        {
            _player.view.frame = CGRectMake(-50, 0, 200, 100);

        }
        else
        {
            _player.view.frame = CGRectMake(-50, 0, 200, 100);
            
            //[player.view setFrame:_overlay.testView.frame];

        }
        
        _player.view.backgroundColor = [UIColor clearColor];
        _player.backgroundView.backgroundColor = [UIColor clearColor];
        
        _player.view.transform = CGAffineTransformMakeRotation(M_PI_2);
        _overlay.viewBanner.transform = CGAffineTransformMakeRotation(M_PI_2);
        
        APPDATA.appDataViewBanner = _overlay.viewBanner;
        
        
        
        APPDATA.appDataIvBannerImage = _overlay.ivBannerImage;

        
        _overlay.viewBanner.alpha = 0.0f;
        
   [_overlay.viewBanner setFrame:CGRectMake((_overlay.viewBanner.frame.origin.x + SCREEN.size.width/2) -_overlay.viewBanner.frame.size.height, _overlay.viewBanner.frame.origin.y + 500, _overlay.viewBanner.frame.size.width, _overlay.viewBanner.frame.size.height)];
        
        

      
        
        for(UIView* subV in _player.view.subviews) {
            subV.backgroundColor = [UIColor clearColor];
        }
        
        [_overlay.view addSubview:_player.view];
        [_player play];
        
        [UIView animateWithDuration:3.4 animations:^{

            
            if(SMALL_SCREEN)
            {
                     [_player.view setFrame:CGRectMake(_player.view.frame.origin.x, _player.view.frame.origin.y + 500, _player.view.frame.size.width, _player.view.frame.size.height)];
            }
            
            else
            {
                     [_player.view setFrame:CGRectMake(_player.view.frame.origin.x, _player.view.frame.origin.y + 980, _player.view.frame.size.width, _player.view.frame.size.height)];
            }
       
        
        }completion:^(BOOL finished) {
        
            _overlay.viewBanner.alpha = 1.0f;

            
            [UIView animateWithDuration:3.4 animations:^{
                

                [_overlay.viewBanner setFrame:CGRectMake(_overlay.viewBanner.frame.origin.x, _overlay.viewBanner.frame.origin.y - 1000, _overlay.viewBanner.frame.size.width, _overlay.viewBanner.frame.size.height)];
                
            }completion:^(BOOL finished) {
                
                
            }];
            
        }];
        

    });
    
     }


   else

       {
                   [[[UIAlertView alloc]initWithTitle:@"ניתן לצלם רק במצב אופקי נטוי שמאלה" message:@"אנא סובב את מכשירך" delegate:self cancelButtonTitle:@"אישור" otherButtonTitles:nil] show];
    
       }
}

- (void)playbackDidFinish:(NSNotification*)aNotification {
    MPMoviePlayerController *moviePlayer = aNotification.object;
    NSNumber *reason = [aNotification.userInfo objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
    if ([reason intValue] == MPMovieFinishReasonPlaybackEnded) {
        if (moviePlayer.currentPlaybackTime == moviePlayer.playableDuration) {
            [moviePlayer stop];
        }
    }
}

- (void)videoPlayBackDidFinish:(NSNotification *)notification {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    // Stop the video player and remove it from view
    [_player stop];
    [_player.view removeFromSuperview];
    _player = nil;
    

    
}


-(void)sendShouldStopFilmong
{
    //[[[UIApplication sharedApplication]keyWindow]makeToast:@"FINISHED"];
    
    [_picker stopVideoCapture];
}




- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    NSURL * movieURL = [info valueForKey:UIImagePickerControllerMediaURL];// Get the URL of where the movie is stored.
    UISaveVideoAtPathToSavedPhotosAlbum([movieURL path], nil, nil, nil);
    
    
    NSLog(@">>>>>PATH>>>>>%@",movieURL);
    
    APPDATA.hasVideo = YES;
    
    APPDATA.appDataURL = movieURL;
    
    //[_picker popViewControllerAnimated:YES];
    
    [_picker dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)btnTakeVideoTapped:(UIButton *)sender
{
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;

    _picker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
    
    self.picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    self.picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    _picker.videoQuality =  UIImagePickerControllerQualityTypeHigh;
   
    
    
    self.picker.showsCameraControls = NO;
    self.picker.navigationBarHidden = YES;
    self.picker.toolbarHidden = YES;
    self.picker.wantsFullScreenLayout = YES;
    
    // Insert the overlay
    self.overlay = [[OverlayViewController alloc] initWithNibName:@"OverlayViewController" bundle:nil];
   self.overlay.delegate = self;
    self.picker.cameraOverlayView = self.overlay.view;
    self.picker.delegate = self;
//
    
    
    
    //[self presentModalViewController:self.picker animated:NO];
    
    [self presentViewController:_picker animated:YES completion:nil];
}



@end
