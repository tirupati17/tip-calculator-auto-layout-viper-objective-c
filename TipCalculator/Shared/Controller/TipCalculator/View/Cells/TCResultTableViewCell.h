//
//  TCResultTableViewCell.h
//  TipCalculator
//
//  Created by Tirupati Balan on 28/05/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const TCResultTableViewCellIdentifier = @"TCResultTableViewCell";

@interface TCResultTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *tipStaticLabel;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UILabel *totalStaticLabel;
@property (nonatomic, strong) UILabel *resultLabel;

@end
