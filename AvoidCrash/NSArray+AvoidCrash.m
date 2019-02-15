//
//  NSArray+AvoidCrash.m
//  AvoidCrash
//
//  Created by mac on 16/9/21.
//  Copyright © 2016年 chenfanfang. All rights reserved.
//

#import "NSArray+AvoidCrash.h"

#import "AvoidCrash.h"

@implementation NSArray (AvoidCrash)


+ (void)avoidCrashExchangeMethod {
    
    //class method
    
    //instance array method exchange
    [AvoidCrash exchangeClassMethod:[self class] method1Sel:@selector(arrayWithObjects:count:) method2Sel:@selector(AvoidCrashArrayWithObjects:count:)];
    
    //instance method
    
//    Class __NSArray = NSClassFromString(@"NSArray");
//    //objectAtIndexedSubscript:
//    //防止array[100]这种方式取元素的崩溃
//    [AvoidCrash exchangeInstanceMethod:__NSArray method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(avoidCrashObjectAtIndexedSubscript:)];
//
//    //objectsAtIndexes:
//    [AvoidCrash exchangeInstanceMethod:__NSArray method1Sel:@selector(objectsAtIndexes:) method2Sel:@selector(avoidCrashObjectsAtIndexes:)];
    
    // __NSArrayI，__NSArray0，__NSSingleObjectArrayI
    [AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArray0") method1Sel:@selector(objectAtIndex:) method2Sel:@selector(avoidCrashObjectsAtIndex:)];
    [AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArray0") method1Sel:@selector(objectsAtIndexes:) method2Sel:@selector(avoidCrashObjectsAtIndexes:)];
    [AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArray0") method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(avoidCrashObjectAtIndexedSubscript:)];
    
    [AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArrayI") method1Sel:@selector(objectAtIndex:) method2Sel:@selector(lpm_IavoidCrashObjectsAtIndex:)];
    [AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArrayI") method1Sel:@selector(objectsAtIndexes:) method2Sel:@selector(lpm_IavoidCrashObjectsAtIndexes:)];
    [AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSArrayI") method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(lpm_IavoidCrashObjectAtIndexedSubscript:)];
    
    [AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSSingleObjectArrayI") method1Sel:@selector(objectAtIndex:) method2Sel:@selector(lpm_SavoidCrashObjectsAtIndex:)];
    [AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSSingleObjectArrayI") method1Sel:@selector(objectsAtIndexes:) method2Sel:@selector(lpm_SavoidCrashObjectsAtIndexes:)];
    [AvoidCrash exchangeInstanceMethod:NSClassFromString(@"__NSSingleObjectArrayI") method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(lpm_SavoidCrashObjectAtIndexedSubscript:)];
    
}


//=================================================================
//                        instance array
//=================================================================
#pragma mark - instance array


+ (instancetype)AvoidCrashArrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self AvoidCrashArrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to remove nil object and instance a array.";
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
        //以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self AvoidCrashArrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}



//=================================================================
//                     objectAtIndexedSubscript:
//=================================================================
#pragma mark - objectAtIndexedSubscript:
- (id)avoidCrashObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self avoidCrashObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }

}


//=================================================================
//                       objectsAtIndexes:
//=================================================================
#pragma mark - objectsAtIndexes:

- (NSArray *)avoidCrashObjectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self avoidCrashObjectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return returnArray;
    }
}


//=================================================================
//                       objectsAtIndex:
//=================================================================
#pragma mark - objectsAtIndexes:

- (id)avoidCrashObjectsAtIndex:(NSInteger)index {
    
    id object = nil;
    @try {
        object = [self avoidCrashObjectsAtIndex:index];
    } @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return object;
    }
}



// __NSArrayI
//=================================================================
//                     objectAtIndexedSubscript:
//=================================================================
#pragma mark - objectAtIndexedSubscript:
- (id)lpm_IavoidCrashObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self lpm_IavoidCrashObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }
    
}


//=================================================================
//                       objectsAtIndexes:
//=================================================================
#pragma mark - objectsAtIndexes:

- (NSArray *)lpm_IavoidCrashObjectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self lpm_IavoidCrashObjectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return returnArray;
    }
}


//=================================================================
//                       objectsAtIndex:
//=================================================================
#pragma mark - objectsAtIndexes:

- (id)lpm_IavoidCrashObjectsAtIndex:(NSInteger)index {
    
    id object = nil;
    @try {
        object = [self lpm_IavoidCrashObjectsAtIndex:index];
    } @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return object;
    }
}


// __NSSingleObjectArrayI
//=================================================================
//                     objectAtIndexedSubscript:
//=================================================================
#pragma mark - objectAtIndexedSubscript:
- (id)lpm_SavoidCrashObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self lpm_SavoidCrashObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }
    
}


//=================================================================
//                       objectsAtIndexes:
//=================================================================
#pragma mark - objectsAtIndexes:

- (NSArray *)lpm_SavoidCrashObjectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self lpm_SavoidCrashObjectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return returnArray;
    }
}


//=================================================================
//                       objectsAtIndex:
//=================================================================
#pragma mark - objectsAtIndexes:

- (id)lpm_SavoidCrashObjectsAtIndex:(NSInteger)index {
    
    id object = nil;
    @try {
        object = [self lpm_SavoidCrashObjectsAtIndex:index];
    } @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return object;
    }
}


@end
