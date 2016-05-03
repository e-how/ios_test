//
//  ViewController.m
//  zyhgithub
//
//  Created by 张益豪 on 15/8/27.
//  Copyright (c) 2015年 张益豪. All rights reserved.
//

#import "ViewController.h"
#import "tModel.h"
#import "tView.h"

#import <JavaScriptCore/JavaScriptCore.h> 

@interface ViewController ()<UIWebViewDelegate>
{
    UIWebView* myWebView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tModel* model = [[tModel alloc] init];
    model.title1 = @"hello world";
    tView * tV = [[tView alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    tV.lab.text = model.title1;
    tV.userInteractionEnabled = YES;
    tV.sel =  @selector(rightAction);
    [tV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightAction)]];
    [self.view addSubview:tV];
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"调JS" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //初始化webview
    myWebView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-22)];
    myWebView.delegate=self;
    //添加webview到当前viewcontroller的view上
    [self.view addSubview:myWebView];
    
 
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Second" ofType:@"html"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:path]];
    [myWebView loadRequest:request];
    
    
    
    JSContext *context = [myWebView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //定义好JS要调用的方法, share就是调用的share方法名
    
    context.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
    
    context[@"share"] = ^() {
        NSLog(@"+++++++Begin Log+++++++");
        NSArray *args = [JSContext currentArguments];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"方式二" message:@"这是OC原生的弹出窗" delegate:self cancelButtonTitle:@"收到" otherButtonTitles:nil];
            [alertView show];
        });
        
        
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal.toString);
            
        }
        
        NSLog(@"-------End Log-------");
    };
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)rightAction
{
    JSContext *context = [myWebView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *textJS = @"showAlert('这里是JS中alert弹出的message')";
    [context evaluateScript:textJS];
}
#pragma mark --webViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //网页加载之前会调用此方法
    
    //retrun YES 表示正常加载网页 返回NO 将停止网页加载
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    //开始加载网页调用此方法
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
//    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    NSString *alertJS=@"alert('test js OC')"; //准备执行的js代码
//    [context evaluateScript:alertJS];//通过oc方法调用js的alert
//    
//    
//    context[@"test1"] = ^() {
//        NSArray *args = [JSContext currentArguments];
//        for (id obj in args) {
//            NSLog(@"%@",obj);
//        }
//    };
//    //此处我们没有写后台（但是前面我们已经知道iOS是可以调用js的，我们模拟一下）
//    //首先准备一下js代码，来调用js的函数test1 然后执行
//    //一个参数
//    NSString *jsFunctStr=@"test1('参数1')";
//    [context evaluateScript:jsFunctStr];
//    
//    //二个参数
//    NSString *jsFunctStr1=@"test1('参数a','参数b')";
//    [context evaluateScript:jsFunctStr1];
//    
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //网页加载失败 调用此方法
}

@end
