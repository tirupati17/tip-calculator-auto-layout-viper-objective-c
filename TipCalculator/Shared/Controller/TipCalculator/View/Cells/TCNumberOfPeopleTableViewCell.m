//
//  TCNumberOfPeopleTableViewCell.m
//  TipCalculator
//
//  Created by Tirupati Balan on 28/05/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

#import "TCNumberOfPeopleTableViewCell.h"
#import <PureLayout/PureLayout.h>

#import "ANStepperView.h"

@implementation TCNumberOfPeopleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureView];
    }
    return self;
}

- (void)configureView {
    self.stepperView = [ANStepperView newAutoLayoutView];
    self.stepperView.stepperType = ANStepperTypeMinimalAnimated;
    self.stepperView.backgroundColor = [UIColor whiteColor];
    self.stepperView.tintColor = [UIColor lightGrayColor];
    self.stepperView.cornerRadius = 0.0f;
    self.stepperView.labelTextColor = [UIColor blackColor];
    self.stepperView.minimumValue = 1.0f;
    
    [self.contentView addSubview:self.stepperView];
    [self.contentView setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    [self.stepperView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [super updateConstraints];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
