//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

@import GoogleMobileAds;

#import "TipCalculatorView.h"
#import <PureLayout/PureLayout.h>

#import "TCBillTableViewCell.h"
#import "TCTipTableViewCell.h"
#import "TCNumberOfPeopleTableViewCell.h"
#import "TCResultTableViewCell.h"
#import "ANStepperView.h"

@interface TipCalculatorView () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, TCBillTableViewCellDelegate, TCTipTableViewCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) BOOL didSetupConstraints;
@property (nonatomic, assign) TipCalculatorCell tipCalculatorCell;
@property (nonatomic, strong) NSMutableDictionary *tipCalculatorData;

@end

@implementation TipCalculatorView

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self defaultSetup];
    [self configureGoogleAds];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

#pragma mark - Methods

- (void)defaultSetup {
    self.title = @"Tip Calculator";
    
    self.tableView = [UITableView newAutoLayoutView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.bannerView = [GADBannerView newAutoLayoutView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bannerView];
    [self.view setNeedsUpdateConstraints];  // bootstrap Auto Layout
}

- (void)configureGoogleAds {
    self.bannerView.adUnitID = @"ca-app-pub-4961045217927492/7141317962";
    self.bannerView.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[ kGADSimulatorID ];
    [self.bannerView loadRequest:request];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        [self.tableView autoSetDimensionsToSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 50)];
        
        [self.bannerView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.tableView];
        [self.bannerView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.tableView];
        [self.bannerView autoSetDimension:ALDimensionHeight toSize:50.0];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case kBillCell:
            return 80.0f;
            break;
        case kTipCell:
            return 80.0f;
            break;
        case kNumberOfPeopleCell:
            return 50.0f;
            break;
        case kResultCell:
            return 120.0f;
        default:
            break;
    }
    return 0.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case kBillCell:
        {
            TCBillTableViewCell *cell = [[TCBillTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TCBillTableViewCellIdentifier];
            cell.delegate = self;
            return cell;
        }
            break;
        case kTipCell:
        {
            TCTipTableViewCell *cell = [[TCTipTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TCTipTableViewCellIdentifier];
            cell.delegate = self;
            return cell;
        }
            break;
        case kNumberOfPeopleCell:
        {
            TCNumberOfPeopleTableViewCell *cell = [[TCNumberOfPeopleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TCNumberOfPeopleTableViewCellIdentifier];
            [cell.stepperView addTarget:self action:@selector(stepperAction:) forControlEvents:UIControlEventAllEvents];
            return cell;
        }
            break;
        case kResultCell:
        {
            TCResultTableViewCell *cell = [[TCResultTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TCResultTableViewCellIdentifier];
            
            if ([_tipCalculatorData[NumberOfPeopleKey] intValue] > 1) {
                cell.tipStaticLabel.text = @"Tip (per person)";
                cell.totalStaticLabel.text = @"Total (per person)";
            } else {
                cell.tipStaticLabel.text = @"Tip";
                cell.totalStaticLabel.text = @"Total";
            }
            cell.tipLabel.text = _tipCalculatorData[CalculatedTipKey];
            cell.resultLabel.text = _tipCalculatorData[TotalKey];

            return cell;
        }
        default:
            break;
    }
    return nil;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (BOOL)tableView:(nonnull UITableView *)tableView shouldHighlightRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - TipCalculatorViewProtocol

- (void)applyCalculationWithData:(NSDictionary *)data {
    NSLog(@"Calculated data: %@", data);
    _tipCalculatorData[CalculatedTipKey] = [data objectForKey:CalculatedTipKey];
    _tipCalculatorData[TotalKey] = [data objectForKey:TotalKey];

    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - Methods

- (NSMutableDictionary *)tipCalculatorData {
    if (_tipCalculatorData) {
        return _tipCalculatorData;
    }
    _tipCalculatorData = [NSMutableDictionary dictionary];
    
    _tipCalculatorData[BillKey] = @"0";
    _tipCalculatorData[TipKey] = @"0";
    _tipCalculatorData[NumberOfPeopleKey] = @"1";
    _tipCalculatorData[CalculatedTipKey] = @"0";
    _tipCalculatorData[TotalKey] = @"0";
    
    return _tipCalculatorData;
}

- (void)stepperAction:(ANStepperView *)sender {
    if ([sender.currentTitle intValue] < 1)
        return;
    
    _tipCalculatorData[NumberOfPeopleKey] = sender.currentTitle;
    [self validateAndCalculateTip];
}

- (void)validateAndCalculateTip {
    // Validation here
    [self.presenter calculateTipWithData:self.tipCalculatorData];
}

#pragma mark - TCBillTableViewCellDelegate And TCTipTableViewCellDelegate

- (void)textDidChange:(NSString *)newValue
               forKey:(NSString *)key
               inCell:(id)sender {
    self.tipCalculatorData[key] = newValue;
    [self validateAndCalculateTip];
}

- (void)textDidEnd:(NSString *)newValue
            forKey:(NSString *)key
            inCell:(id)sender {
    self.tipCalculatorData[key] = newValue;
    [self validateAndCalculateTip];
}

@end