//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

#import "TipCalculatorWireFrame.h"
#import "TCRootWireframe.h"

@implementation TipCalculatorWireFrame

+ (void)presentTipCalculatorModuleFrom:(UIWindow *)window;
{
    // Generating module components
    id <TipCalculatorViewProtocol> view = [[TipCalculatorView alloc] init];
    id <TipCalculatorPresenterProtocol, TipCalculatorInteractorOutputProtocol> presenter = [TipCalculatorPresenter new];
    id <TipCalculatorInteractorInputProtocol> interactor = [TipCalculatorInteractor new];
    id <TipCalculatorAPIDataManagerInputProtocol> APIDataManager = [TipCalculatorAPIDataManager new];
    id <TipCalculatorLocalDataManagerInputProtocol> localDataManager = [TipCalculatorLocalDataManager new];
    id <TipCalculatorWireFrameProtocol> wireFrame= [TipCalculatorWireFrame new];
    TCRootWireframe *rootWireframe = [[TCRootWireframe alloc] init];
    
    // Connecting
    view.presenter = presenter;
    presenter.view = view;
    presenter.wireFrame = wireFrame;
    presenter.interactor = interactor;
    interactor.presenter = presenter;
    interactor.APIDataManager = APIDataManager;
    interactor.localDataManager = localDataManager;
    
    [rootWireframe showRootViewController:(UIViewController *)view inWindow:window];
}

@end
