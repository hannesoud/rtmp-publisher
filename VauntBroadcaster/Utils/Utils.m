//
//  Utils.m
//  VauntBroadcaster
//
//  Created by Master on 7/14/15.
//  Copyright (c) 2015 Vaunt. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (BOOL)validateEmail: (NSString *)candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

@end
