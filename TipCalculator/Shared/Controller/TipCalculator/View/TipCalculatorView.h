//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipCalculatorProtocols.h"

@interface TipCalculatorView : UIViewController <TipCalculatorViewProtocol>

@property (nonatomic, strong) id <TipCalculatorPresenterProtocol> presenter;

@end
