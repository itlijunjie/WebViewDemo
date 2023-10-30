//
//  H5ViewController1.m
//  Demo
//
//  Created by ljj on 2023/10/25.
//

#import "H5ViewController1.h"

@import WebKit;
@import Masonry;

@implementation H5ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.defaultWebpagePreferences.preferredContentMode = WKContentModeMobile;
    configuration.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeNone;
    configuration.allowsInlineMediaPlayback = YES;    
     
    WKWebView *_webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
    _webView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_webView];
    
    UIView *superView = self.view;
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView);
    }];
    
#if DEBUG
    [_webView setInspectable:YES];
#endif
        
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"index1.html"]]]];
}

@end
