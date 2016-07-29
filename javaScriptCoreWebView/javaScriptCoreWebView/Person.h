//
//  Person.h
//  javaScriptCoreWebView
//
//  Created by Mac on 16/7/25.
//  Copyright © 2016年 wutong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <JavaScriptCore/JavaScriptCore.h>

@class Person;
@protocol PersonProtocol <JSExport>

- (void)pay;


- (void)seyHello;
- (void)seyHi:(NSArray *)arr;

- (void)gotoVcWith:(NSString *)typeStr title:(NSString *)titleStr;


JSExportAs(gotoAVc,
           - (void)gotoActivityVcWithId:(NSString *)aId title:(NSString *)titleStr
           );
+ (Person *)myAllocInit;
+ (void)seyClassMethod;
@property (nonatomic, strong)JSValue * girlFriend;

@property (nonatomic, strong)NSString *  nickName;
//+ (instancetype)alloc OBJC_SWIFT_UNAVAILABLE("use object initializers instead");
//- (instancetype)init;

@end

@interface Person : NSObject<PersonProtocol>
@property (nonatomic, strong)NSString * nickName;
@property (nonatomic, strong)JSValue * girlFriend;

- (void)pay;

- (void)seyHello;
- (void)seyHi:(NSArray *)arr;

- (void)gotoVcWith:(NSString *)typeStr title:(NSString *)titleStr;
- (void)gotoActivityVcWithId:(NSString *)aId title:(NSString *)titleStr;

+ (void)seyClassMethod;
+ (Person *)myAllocInit;
@end
