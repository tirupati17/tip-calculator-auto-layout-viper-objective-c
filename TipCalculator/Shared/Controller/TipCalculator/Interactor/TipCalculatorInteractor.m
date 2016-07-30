//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

#import "TipCalculatorInteractor.h"
#import "TipCalculatorKeys.h"

@implementation TipCalculatorInteractor

- (NSDictionary *)saveAndReturnCalculatedTip:(NSDictionary *)item {
    float billAmount = [[item objectForKey:BillKey] floatValue];
    float tipPercentage = [[item objectForKey:TipKey] floatValue];
    NSInteger numberOfPeople = [[item objectForKey:NumberOfPeopleKey] intValue];
    
    float calculatedTip = ((billAmount * tipPercentage)/ 100.0f) / numberOfPeople;
    float total = (billAmount + calculatedTip) / numberOfPeople;

    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:[NSString stringWithFormat:@"%0.2f", calculatedTip] forKey:CalculatedTipKey];
    [data setValue:[NSString stringWithFormat:@"%0.2f", total] forKey:TotalKey];

    return data;
}

@end