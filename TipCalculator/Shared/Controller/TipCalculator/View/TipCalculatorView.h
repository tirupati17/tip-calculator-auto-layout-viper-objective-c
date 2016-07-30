//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipCalculatorProtocols.h"

typedef enum : NSUInteger {
    kBillCell = 0,
    kTipCell,
    kNumberOfPeopleCell,
    kResultCell,
} TipCalculatorCell;

@class GADBannerView;

@interface TipCalculatorView : UIViewController <TipCalculatorViewProtocol>

@property (nonatomic, strong) id <TipCalculatorPresenterProtocol> presenter;
@property (nonatomic, strong) GADBannerView *bannerView;
@end
