//
//  CameraViewController.m
//  VauntBroadcaster
//
//  Created by Master on 7/14/15.
//  Copyright (c) 2015 Vaunt. All rights reserved.
//

#import "CameraViewController.h"
#import "VCSimpleSession.h"

@interface CameraViewController () <VCSessionDelegate>
@property (nonatomic, retain) VCSimpleSession* session;
@property (nonatomic, strong) NSString *email;
@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _session = [[VCSimpleSession alloc] initWithVideoSize:CGSizeMake(1280, 720) frameRate:30 bitrate:1000000 useInterfaceOrientation:NO];
    
    [self.previewView addSubview:_session.previewView];
    _session.previewView.frame = self.previewView.bounds;
    _session.delegate = self;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    _email = [userDefaults valueForKey:@"email"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onConnectClicked:(id)sender {
    
    switch(_session.rtmpSessionState) {
        case VCSessionStateNone:
        case VCSessionStatePreviewStarted:
        case VCSessionStateEnded:
        case VCSessionStateError:
            [_session startRtmpSessionWithURL:@"rtmp://ec2-52-2-155-167.compute-1.amazonaws.com/mystream" andStreamKey:@"davidtest"];
            break;
        default:
            [_session endRtmpSession];
            break;
    }
}

- (IBAction)onSwitchCameraClicked:(id)sender {
    VCCameraState cameraState = [_session cameraState];
    if (cameraState == VCCameraStateBack) {
        [_session setCameraState:VCCameraStateFront];
    } else if (cameraState == VCCameraStateFront) {
        [_session setCameraState:VCCameraStateBack];
    }
}

- (void) connectionStatusChanged:(VCSessionState) state
{
    switch(state) {
        case VCSessionStateStarting:
            [self.btnConnect setTitle:@"Connecting" forState:UIControlStateNormal];
            break;
        case VCSessionStateStarted:
            [self.btnConnect setTitle:@"Disconnect" forState:UIControlStateNormal];
            break;
        default:
            [self.btnConnect setTitle:@"Connect" forState:UIControlStateNormal];
            break;
    }
}

@end
