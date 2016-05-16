//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TipCalculatorProtocols.h"


@interface TipCalculatorInteractor : NSObject <TipCalculatorInteractorInputProtocol>

@property (nonatomic, weak) id <TipCalculatorInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <TipCalculatorAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <TipCalculatorLocalDataManagerInputProtocol> localDataManager;

@end