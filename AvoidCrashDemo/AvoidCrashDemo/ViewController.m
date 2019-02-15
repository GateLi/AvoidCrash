//
//  ViewController.m
//  AvoidCrashDemo
//
//  Created by mac on 16/9/22.
//  Copyright © 2016年 chenfanfang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self NSArray_Test_objectsAtIndexes];
    [self executeAllTestMethod];
}


//=================================================================
//                         NSArray_Test
//=================================================================
#pragma mark - NSArray_Test

- (void)NSArray_Test_InstanceArray {
    NSString *nilStr = nil;
    NSArray *array = @[@"chenfanfang", nilStr, @"iOSDeveloper"];
    NSLog(@"%@",array);
}

- (void)NSArray_Test_ObjectAtIndex {
    NSArray *arr = @[@"chenfanfang"];
    
    NSObject *object = arr[100];
    //由于类簇的原因，目前暂时不能拦截通过objectAtIndex获取数组中的元素而导致的崩溃- (id)objectAtIndex:(NSUInteger)index
    NSLog(@"%@",object);
}

- (void)NSArray_Test_objectsAtIndexes {
    NSArray *array = @[@"chenfanfang"];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:100];
    [array objectsAtIndexes:indexSet];
    
}


//=================================================================
//                       NSMutableArray_Test
//=================================================================
#pragma mark - NSMutableArray_Test

- (void)NSMutableArray_Test_ObjectAtIndex {
    NSMutableArray *array = @[@"chenfanfang"].mutableCopy;
    NSObject *object = array[2];
    //由于类簇的原因，目前暂时不能拦截通过objectAtIndex获取数组中的元素而导致的崩溃- (id)objectAtIndex:(NSUInteger)index
    NSLog(@"%@",object);
}

- (void)NSMutableArray_Test_SetObjectAtIndex {
    NSMutableArray *array = @[@"chenfanfang"].mutableCopy;
    array[3] = @"iOS";
}

- (void)NSMutableArray_Test_RemoveObjectAtIndex {
    NSMutableArray *array = @[@"chenfanfang", @"iOSDeveloper"].mutableCopy;
    [array removeObjectAtIndex:5];
}

- (void)NSMutableArray_Test_InsertObjectAtIndex {
    
    NSMutableArray *array = @[@"chenfanfang"].mutableCopy;
    
    //test1    beyond bounds
    [array insertObject:@"cool" atIndex:5];
    
    
    //test2    insert nil obj
    
    //[array insertObject:nil atIndex:0];
    
    //test3    insert nil obj
    
    //NSString *nilStr = nil;
    //[array addObject:nilStr]; //其本质是调用insertObject:
}

//=================================================================
//                       NSDictionary_Test
//=================================================================
#pragma mark - NSDictionary_Test

- (void)NSDictionary_Test_InstanceDictionary {
    NSString *nilStr = nil;
    NSDictionary *dict = @{
                           @"name" : @"chenfanfang",
                           @"age" : nilStr
                           };
    NSLog(@"%@",dict);
}

//=================================================================
//                       NSMutableDictionary_Test
//=================================================================
#pragma mark - NSMutableDictionary_Test

- (void)NSMutableDictionary_Test_SetObjectForKey {
    
    NSMutableDictionary *dict = @{
                                   @"name" : @"chenfanfang"
                                   
                                   }.mutableCopy;
    NSString *ageKey = nil;
    dict[ageKey] = @(25);
    NSLog(@"%@",dict);
}

- (void)NSMutableDictionary_Test_RemoveObjectForKey {
    
    NSMutableDictionary *dict = @{
                                  @"name" : @"chenfanfang",
                                  @"age" : @(25)
                                  
                                  }.mutableCopy;
    NSString *key = nil;
    [dict removeObjectForKey:key];
    
    NSLog(@"%@",dict);
}


//=================================================================
//                       NSString_Test
//=================================================================
#pragma mark - NSString_Test

- (void)NSString_Test_CharacterAtIndex {
    NSString *str = @"chenfanfang";
    
    unichar characteristic = [str characterAtIndex:100];
    NSLog(@"--%c--",characteristic);
}

- (void)NSString_Test_SubstringFromIndex {
    NSString *str = @"chenfanfang";
    
    NSString *subStr = [str substringFromIndex:100];
    NSLog(@"%@",subStr);
}

- (void)NSString_Test_SubstringToIndex {
    NSString *str = @"chenfanfang";
    
    NSString *subStr = [str substringToIndex:100];
    NSLog(@"%@",subStr);
}

- (void)NSString_Test_SubstringWithRange {
    NSString *str = @"chenfanfang";
    
    NSRange range = NSMakeRange(0, 100);
    NSString *subStr = [str substringWithRange:range];
    NSLog(@"%@",subStr);
}

- (void)NSString_Test_StringByReplacingOccurrencesOfString {
    NSString *str = @"chenfanfang";
    
    NSString *nilStr = nil;
    str = [str stringByReplacingOccurrencesOfString:nilStr withString:nilStr];
    NSLog(@"%@",str);
}

- (void)NSString_Test_StringByReplacingOccurrencesOfStringRange {
    NSString *str = @"chenfanfang";
    
    NSRange range = NSMakeRange(0, 1000);
    str = [str stringByReplacingOccurrencesOfString:@"chen" withString:@"" options:NSCaseInsensitiveSearch range:range];
    NSLog(@"%@",str);
}

- (void)NSString_Test_stringByReplacingCharactersInRangeWithString {
    NSString *str = @"chenfanfang";
    
    NSRange range = NSMakeRange(0, 1000);
    str = [str stringByReplacingCharactersInRange:range withString:@"cff"];
    NSLog(@"%@",str);
}


//=================================================================
//                       NSMutableString_Test
//=================================================================
#pragma mark - NSMutableString_Test

- (void)NSMutableString_Test_ReplaceCharactersInRange {
    NSMutableString *strM = [NSMutableString stringWithFormat:@"chenfanfang"];
    NSRange range = NSMakeRange(0, 1000);
    [strM replaceCharactersInRange:range withString:@"--"];
}

- (void)NSMutableString_Test_InsertStringAtIndex{
    NSMutableString *strM = [NSMutableString stringWithFormat:@"chenfanfang"];
    [strM insertString:@"cool" atIndex:1000];
}


- (void)NSMutableString_TestDeleteCharactersInRange{
    NSMutableString *strM = [NSMutableString stringWithFormat:@"chenfanfang"];
    NSRange range = NSMakeRange(0, 1000);
    [strM deleteCharactersInRange:range];
}

//=================================================================
//                      NSAttributedString_Test
//=================================================================
#pragma mark - NSAttributedString_Test

- (void)NSAttributedString_Test_InitWithString {
    NSString *str = nil;
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str];
    NSLog(@"%@",attributeStr);
}

- (void)NSAttributedString_Test_InitWithAttributedString {
    NSAttributedString *nilAttributedStr = nil;
    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithAttributedString:nilAttributedStr];
    NSLog(@"%@",attributedStr);
    
    
}

- (void)NSAttributedString_Test_InitWithStringAttributes {
    NSDictionary *attributes = @{
                           NSForegroundColorAttributeName : [UIColor redColor]
                           };
    NSString *nilStr = nil;
    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithString:nilStr attributes:attributes];
    NSLog(@"%@",attributedStr);
}

//=================================================================
//                   NSMutableAttributedString_Test
//=================================================================
#pragma mark - NSMutableAttributedString_Test

- (void)NSMutableAttributedString_Test_InitWithString {
    
    NSString *nilStr = nil;
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:nilStr];
    NSLog(@"%@",attrStrM);
}

- (void)NSMutableAttributedString_Test_InitWithStringAttributes {

    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName : [UIColor redColor]
                                 };
    NSString *nilStr = nil;
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:nilStr attributes:attributes];
    NSLog(@"%@",attrStrM);
}

- (void)NSMutableAttributedString_Test_InitWithAttributedString {
    NSAttributedString *nilAttributedStr = nil;
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithAttributedString:nilAttributedStr];
    NSLog(@"%@",attributedStr);
    
    
}

//=================================================================
//                            KVC
//=================================================================
#pragma mark - KVC


- (void)KVC_SetValueForKey {
    //创建一个任意的对象
    UITableView *anyObject = [UITableView new];
    [anyObject setValue:self forKey:@"AvoidCrash"];
    
}

- (void)KVC_SetValueforKeyPath {
    UITableView *anyObject = [UITableView new];
    [anyObject setValue:self forKey:@"AvoidCrash"];
}


- (void)KVC_SetValuesForKeysWithDictionary {
    //创建一个任意的对象
    UITableView *anyObject = [UITableView new];
    NSDictionary *dictionary = @{
                                 @"name" : @"chenfanfang"
                                 };
    
    [anyObject setValuesForKeysWithDictionary:dictionary];
}





//=================================================================
//                      执行所有test的方法
//=================================================================
#pragma mark - 执行所有test的方法

- (void)executeAllTestMethod {
    [self NSArray_Test_InstanceArray];
    [self NSArray_Test_ObjectAtIndex];
    
    
    [self NSMutableArray_Test_ObjectAtIndex];
    [self NSMutableArray_Test_SetObjectAtIndex];
    [self NSMutableArray_Test_RemoveObjectAtIndex];
    [self NSMutableArray_Test_InsertObjectAtIndex];
    
    
    [self NSDictionary_Test_InstanceDictionary];
    [self NSMutableDictionary_Test_SetObjectForKey];
    [self NSMutableDictionary_Test_RemoveObjectForKey];
    
    
    [self NSString_Test_CharacterAtIndex];
    [self NSString_Test_SubstringFromIndex];
    [self NSString_Test_SubstringToIndex];
    [self NSString_Test_SubstringWithRange];
    [self NSString_Test_StringByReplacingOccurrencesOfString];
    [self NSString_Test_StringByReplacingOccurrencesOfStringRange];
    [self NSString_Test_stringByReplacingCharactersInRangeWithString];
    
    
    [self NSMutableString_Test_ReplaceCharactersInRange];
    [self NSMutableString_Test_InsertStringAtIndex];
    [self NSMutableString_TestDeleteCharactersInRange];
    
    
    [self NSAttributedString_Test_InitWithString];
    [self NSAttributedString_Test_InitWithAttributedString];
    [self NSAttributedString_Test_InitWithStringAttributes];
    
    
    [self NSMutableAttributedString_Test_InitWithString];
    [self NSMutableAttributedString_Test_InitWithStringAttributes];
    [self NSMutableAttributedString_Test_InitWithAttributedString];
    
    [self KVC_SetValueForKey];
    [self KVC_SetValueforKeyPath];
    [self KVC_SetValuesForKeysWithDictionary];
}




@end
















