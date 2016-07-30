//
//  TCResultTableViewCell.m
//  TipCalculator
//
//  Created by Tirupati Balan on 28/05/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

#import "TCResultTableViewCell.h"
#import <PureLayout/PureLayout.h>

@interface TCResultTableViewCell ()

@end

@implementation TCResultTableViewCell

@synthesize tipStaticLabel;
@synthesize tipLabel;
@synthesize totalStaticLabel;
@synthesize resultLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureView];
    }
    return self;
}

- (void)configureView {
    self.tipStaticLabel = [UILabel newAutoLayoutView];
    [self.tipStaticLabel setTextAlignment:NSTextAlignmentCenter];
    [self.tipStaticLabel setTextColor:[UIColor darkTextColor]];
    
    self.tipLabel = [UILabel newAutoLayoutView];
    [self.tipLabel setBackgroundColor:[UIColor colorWithWhite:.99f alpha:1.0f]];
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    self.tipLabel.font = [UIFont fontWithName:@"Verdana" size:18];

    self.totalStaticLabel = [UILabel newAutoLayoutView];
    [self.totalStaticLabel setTextAlignment:NSTextAlignmentCenter];
    [self.totalStaticLabel setTextColor:[UIColor darkTextColor]];
    
    self.resultLabel = [UILabel newAutoLayoutView];
    [self.resultLabel setBackgroundColor:[UIColor colorWithWhite:.99f alpha:1.0f]];
    self.resultLabel.textAlignment = NSTextAlignmentCenter;
    self.resultLabel.font = [UIFont fontWithName:@"Verdana" size:18];
    
    [self.contentView addSubview:self.tipStaticLabel];
    [self.contentView addSubview:self.tipLabel];
    [self.contentView addSubview:self.totalStaticLabel];
    [self.contentView addSubview:self.resultLabel];
    [self.contentView setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    NSArray *aboveViews = @[self.tipStaticLabel, self.tipLabel];
    NSArray *belowViews = @[self.totalStaticLabel, self.resultLabel];

    [aboveViews autoSetViewsDimension:ALDimensionHeight toSize:60.0f];
    [aboveViews autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0.0f insetSpacing:NO matchedSizes:YES];
    [self.tipStaticLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0.0f];
    
    [belowViews autoSetViewsDimension:ALDimensionHeight toSize:60.0f];
    [belowViews autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0.0f insetSpacing:NO matchedSizes:YES];
    
    [self.totalStaticLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.0f];
    [super updateConstraints];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
