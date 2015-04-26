//
//  GoogleLoginApi.h
//  NA
//
//  Created by Alex Taffe on 1/20/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

@import UIKit;

@interface GoogleLoginApi : UIViewController<UIWebViewDelegate>{
    NSMutableData *receivedData;
    IBOutlet UIWebView *webview;
}
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (nonatomic, retain) NSString *isLogin;
@property (assign, nonatomic) Boolean isReader;

@end
