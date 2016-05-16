//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TipCalculatorInteractorOutputProtocol;
@protocol TipCalculatorInteractorInputProtocol;
@protocol TipCalculatorViewProtocol;
@protocol TipCalculatorPresenterProtocol;
@protocol TipCalculatorLocalDataManagerInputProtocol;
@protocol TipCalculatorAPIDataManagerInputProtocol;


@class TipCalculatorWireFrame;

@protocol TipCalculatorViewProtocol
@required
@property (nonatomic, strong) id <TipCalculatorPresenterProtocol> presenter;
/**
 * Add here your methods for communication PRESENTER -> VIEWCONTROLLER
 */
@end

@protocol TipCalculatorWireFrameProtocol
@required
+ (void)presentTipCalculatorModuleFrom:(id)fromView;
/**
 * Add here your methods for communication PRESENTER -> WIREFRAME
 */
@end

@protocol TipCalculatorPresenterProtocol
@required
@property (nonatomic, weak) id <TipCalculatorViewProtocol> view;
@property (nonatomic, strong) id <TipCalculatorInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <TipCalculatorWireFrameProtocol> wireFrame;
/**
 * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
 */
@end

@protocol TipCalculatorInteractorOutputProtocol
/**
 * Add here your methods for communication INTERACTOR -> PRESENTER
 */
@end

@protocol TipCalculatorInteractorInputProtocol
@required
@property (nonatomic, weak) id <TipCalculatorInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <TipCalculatorAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <TipCalculatorLocalDataManagerInputProtocol> localDataManager;
/**
 * Add here your methods for communication PRESENTER -> INTERACTOR
 */
@end


@protocol TipCalculatorDataManagerInputProtocol
/**
 * Add here your methods for communication INTERACTOR -> DATAMANAGER
 */
@end

@protocol TipCalculatorAPIDataManagerInputProtocol <TipCalculatorDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
 */
@end

@protocol TipCalculatorLocalDataManagerInputProtocol <TipCalculatorDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> LOCLDATAMANAGER
 */
@end


