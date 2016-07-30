//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

#import "TipCalculatorPresenter.h"
#import "TipCalculatorWireframe.h"
#import "TipCalculatorItem.h"

@implementation TipCalculatorPresenter


- (void)calculateTipWithData:(NSDictionary *)item {
    [self.view applyCalculationWithData:[self.interactor saveAndReturnCalculatedTip:item]];
}

@end