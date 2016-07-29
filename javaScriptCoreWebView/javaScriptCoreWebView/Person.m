//
//  Person.m
//  javaScriptCoreWebView
//
//  Created by Mac on 16/7/25.
//  Copyright © 2016年 wutong. All rights reserved.
//

#import "Person.h"


@implementation Person

- (void)setGirlFriend:(JSValue *)girlFriend
{
    _girlFriend = (JSValue *)[JSManagedValue managedValueWithValue:girlFriend];
}

- (void)pay
{
    NSLog(@"付钱!!!");
}

- (void)setNickName:(NSString *)nickName
{
    _nickName = nickName;
}

//- (void)setNickName:(NSString *)nickName
//{
//}




- (void)seyHello
{
    NSLog(@"------helloh");
}


- (void)seyHi:(NSArray *)arr
{
    
    NSArray * testArr = [NSArray array];
    NSMutableArray * testMArr = [NSMutableArray array];
    
    NSLog(@"%@----M:%@", NSStringFromClass([testArr class]), NSStringFromClass([testMArr class]));
    NSLog(@"----%@", NSStringFromClass([arr class]));
    
    NSLog(@"hi-----%@", arr);
    
}


- (void)gotoVcWith:(NSString *)typeStr title:(NSString *)titleStr
{
    NSLog(@"typeStr:%@ -----titleStr:%@", typeStr, titleStr);
}

- (void)gotoActivityVcWithId:(NSString *)aId title:(NSString *)titleStr
{
    NSLog(@"活动id:%@-----活动title:%@", aId, titleStr);
}

+ (Person *)myAllocInit
{
    return [[Person alloc]init];
}

+ (void)seyClassMethod
{
    NSLog(@"hi, 我是类方法哦~");
}


- (void)dealloc
{
    NSLog(@"person-----挂了!");
}

@end
