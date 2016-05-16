//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TipCalculatorProtocols.h"

@class TipCalculatorWireFrame;

@interface TipCalculatorPresenter : NSObject <TipCalculatorPresenterProtocol, TipCalculatorInteractorOutputProtocol>

@property (nonatomic, weak) id <TipCalculatorViewProtocol> view;
@property (nonatomic, strong) id <TipCalculatorInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <TipCalculatorWireFrameProtocol> wireFrame;

@end
