//
//  ViewController.m
//  javaScriptCoreWebView
//
//  Created by Mac on 16/7/25.
//  Copyright © 2016年 wutong. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong)JSManagedValue * jsMValue;

@property (nonatomic, strong)JSContext * jsContext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    NSURL * jsFileUrl = [[NSBundle mainBundle] URLForResource:@"jsOCTest.html" withExtension:nil];

    NSURLRequest * request = [NSURLRequest requestWithURL:jsFileUrl];
    
    Person * p = [[Person alloc]init];
    
    [self.webView loadRequest:request];
    
    
        
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        NSLog(@"%@", exception);
        context.exception = exception;
    };
    // 错误测试
    [self.jsContext evaluateScript:@"nibaba();"];
    
    Person *jsObject = [[Person alloc]init];
    self.jsContext[@"boy"] = jsObject;
    self.jsContext[@"Person"] = [Person class];
    
}


- (IBAction)callJsGrilDo:(id)sender {
    
    JSValue * pJsValue = self.jsContext[@"myPerson"];
    Person * person = [pJsValue toObject];
    
    JSManagedValue * jsMa = person.girlFriend;
    JSValue * jsV = jsMa.value;
    JSValue * kk = jsV[@"changeDivColor"];
    
    [kk callWithArguments:nil];
    
}


-(void)dealloc{
    
    NSLog(@"VC-----挂了!!!");
    
    
    if(_jsContext){
//        [_jsContext.virtualMachine removeManagedReference:_jsMValue withOwner:self];
        _jsContext[@"myPerson"] = nil;
        _jsContext = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
