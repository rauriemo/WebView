//
//  WebViewVC.m
//  WebView
//
//  Created by Rafael Auriemo on 1/12/16.
//  Copyright © 2016 Rafael Auriemo. All rights reserved.
//

#import "WebViewVC.h"

@interface WebViewVC () <UIWebViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation WebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadURL:@"https://www.google.com"];
    
    self.webView.delegate = self;
    // Do any additional setup after loading the view.
}


-(void) loadURL:(NSString *)urlString {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}

-(void) webViewDidStartLoad:(UIWebView *)webView{
    [self.activityIndicator startAnimating];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self loadURL:textField.text];
    return YES;
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Load Failed" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *goHome = [UIAlertAction actionWithTitle:@"Go Home" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self loadURL:@"http://www.mobilemakers.co"];
    }];
    
    [alertController addAction:cancel];
    [alertController addAction:goHome];
    
    [self presentViewController:alertController animated:YES completion:nil];
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

@end
