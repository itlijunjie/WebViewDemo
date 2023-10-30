//
//  H5ViewController.m
//  Demo
//
//  Created by ljj on 2023/10/25.
//

#import "H5ViewController.h"
#import "H5ViewController1.h"

@import WebKit;
@import Masonry;

@implementation H5ViewController

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
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"index.html"]]]];
    
    UIButton *btn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat offsetX = 0;
        CGFloat offsetY = 200;
        button.frame = CGRectMake(offsetX, offsetY, [UIScreen mainScreen].bounds.size.width, 40);
        
        [button setTitle:@"Click me after clicking play" forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [button addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
        
        button;
    });
    [self.view addSubview:btn];
}

- (void)click:(UIButton *)btn {
    UIViewController *vc = [[H5ViewController1 alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

@end
