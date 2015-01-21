//
//  GoogleLoginApi.m
//  NA
//
//  Created by Alex Taffe on 1/20/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

#import "GoogleLoginApi.h"

@implementation GoogleLoginApi

@end
/*
 NSString *response = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
 SBJsonParser *jResponse = [[SBJsonParser alloc]init];
 NSDictionary *tokenData = [jResponse objectWithString:response];
 
 [tokenData objectForKey:@"refresh_token"];
 if ([SSKeychain allAccounts] != nil) {
 [SSKeychain deletePasswordForService:@"google" account:[SSKeychain allAccounts][0]];
 }
 NSString *url = [NSString stringWithFormat:@"https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=%@",[tokenData objectForKey:@"access_token"]];
 NSString *jsonAccountInfo = [self getDataFrom:url];
 NSDictionary *decodedAccountInfo = [jResponse objectWithString:jsonAccountInfo];
 //NSString *pdata = [NSString stringWithFormat:@"type=3&token=%@&secret=123&login=%@", [tokenData objectForKey:@"refresh_token"], self.isLogin];
 //NSString *pdata = [NSString stringWithFormat:@"type=3&token=%@&secret=123&login=%@",[tokenData accessToken.secret,self.isLogin];
 //  [dconnection fetch:1 withPostdata:pdata withGetData:@"" isSilent:NO];
 
 
 
 //UIAlertView *alertView = [[UIAlertView alloc]
 //initWithTitle:@"Google Access TOken"
 //message:pdata
 //delegate:nil
 //cancelButtonTitle:@"OK"
 //otherButtonTitles:nil];
 //[alertView show];

*/