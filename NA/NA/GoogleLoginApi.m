//
//  GoogleLoginApi.m
//  NA
//
//  Created by Alex Taffe on 1/20/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

#import "GoogleLoginApi.h"
#import "GAI.h"

@implementation GoogleLoginApi

-(void)test{
    id test = [[GAI sharedInstance] defaultTracker];
    
}

@end
/*
 //
 //  ATLoginViewController.m
 //  YouTube
 //
 //  Created by Alex Taffe on 12/17/14.
 //  Copyright (c) 2014 Alex Taffe. All rights reserved.
 //
 
 #import "ATLoginViewController.h"
 #import "JSON.h"
 #import "SSKeychain.h"
 //#import "ATTabBarController.h"
 #import "YouTube-Swift.h"
 NSString *client_id = @"";;
 NSString *secret = @"";
 NSString *callbakc =  @"http://localhost";;
 NSString *scope = @"https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/youtube";
 NSString *visibleactions = @"http://schemas.google.com/AddActivity";
 @interface ATLoginViewController ()
 
 @end
 
 @implementation ATLoginViewController
 @synthesize webview,isLogin,isReader;
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view.
 
 }
 
 
 -(void) showNewView{
 [self performSegueWithIdentifier:@"initial" sender:self];
 }
 
 -(NSString *)postRequest:(NSDictionary *)postArguments url:(NSString *)theUrl{
 
 NSMutableString *post = [[NSMutableString alloc]init];
 
 int counter = 0;
 for (id key in postArguments) {
 if(counter + 1 == [postArguments count])
 [post appendFormat:@"%@=%@",key,postArguments[key]];
 else
 [post appendFormat:@"%@=%@&",key,postArguments[key]];
 counter++;
 }
 
 NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
 
 NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
 
 NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
 [request setURL:[NSURL URLWithString:theUrl]];
 [request setHTTPMethod:@"POST"];
 [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
 [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
 [request setHTTPBody:postData];
 
 NSHTTPURLResponse* urlResponse = nil;
 NSError *error = [[NSError alloc] init];
 NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
 NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
 NSLog(@"Response Code: %ld", (long)[urlResponse statusCode]);
 if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300) {
 NSLog(@"Response: %@", result);
 
 return result;
 
 }
 else
 return nil;
 }
 - (NSString *) getDataFrom:(NSString *)url{
 NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
 [request setHTTPMethod:@"GET"];
 [request setURL:[NSURL URLWithString:url]];
 
 NSError *error = [[NSError alloc] init];
 NSHTTPURLResponse *responseCode = nil;
 
 NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
 
 if([responseCode statusCode] != 200){
 NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
 return nil;
 }
 
 return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
 }
 
 
 
 - (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
 //    [indicator startAnimating];
 if ([[[request URL] host] isEqualToString:@"localhost"]) {
 
 // Extract oauth_verifier from URL query
 NSString* verifier = nil;
 NSArray* urlParams = [[[request URL] query] componentsSeparatedByString:@"&"];
 for (NSString* param in urlParams) {
 NSArray* keyValue = [param componentsSeparatedByString:@"="];
 NSString* key = [keyValue objectAtIndex:0];
 if ([key isEqualToString:@"code"]) {
 verifier = [keyValue objectAtIndex:1];
 NSLog(@"verifier %@",verifier);
 break;
 }
 }
 
 if (verifier) {
 NSString *data = [NSString stringWithFormat:@"code=%@&client_id=%@&client_secret=%@&redirect_uri=%@&grant_type=authorization_code", verifier,client_id,secret,callbakc];
 NSString *url = [NSString stringWithFormat:@"https://accounts.google.com/o/oauth2/token"];
 NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
 [request setHTTPMethod:@"POST"];
 [request setHTTPBody:[data dataUsingEncoding:NSUTF8StringEncoding]];
 NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
 receivedData = [[NSMutableData alloc] init];
 
 } else {
 // ERROR!
 }
 
 [webView removeFromSuperview];
 
 return NO;
 }
 return YES;
 }
 
 - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
 
 {
 [receivedData appendData:data];
 NSLog(@"verifier %@",receivedData);
 }
 - (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
 message:[NSString stringWithFormat:@"%@", error]
 delegate:nil
 cancelButtonTitle:@"OK"
 otherButtonTitles:nil];
 [alert show];
 }
 
 - (void)connectionDidFinishLoading:(NSURLConnection *)connection
 {
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
 
 [SSKeychain setPassword:[tokenData objectForKey:@"access_token"] forService:@"google" account:[decodedAccountInfo objectForKey:@"email"]];
 
 //NSLog(@"Original token: %@", [tokenData objectForKey:@"access_token"]);
 //NSLog(@"Email: %@\nToken: %@",[[SSKeychain allAccounts][0] objectForKey:@"acct"], [SSKeychain passwordForService:@"google" account:[[SSKeychain allAccounts][0] objectForKey:@"acct"]]);
 
 //NSLog(@"%@",[self getDataFrom:url]);
 //WebServiceSocket *dconnection = [[WebServiceSocket alloc] init];
 // dconnection.delegate = self;
 
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
 }
 - (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }
 
 
 
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 if ([[segue identifier] isEqualToString:@"initial"])
 {
 //ATTabBarController *nextController = [segue destinationViewController];
 
 }
 }
 
 
 @end


*/