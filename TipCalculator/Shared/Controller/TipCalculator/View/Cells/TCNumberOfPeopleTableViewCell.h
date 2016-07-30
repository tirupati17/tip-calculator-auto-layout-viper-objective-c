//
//  TCNumberOfPeopleTableViewCell.h
//  TipCalculator
//
//  Created by Tirupati Balan on 28/05/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const TCNumberOfPeopleTableViewCellIdentifier = @"TCNumberOfPeopleTableViewCell";

@class ANStepperView;

@interface TCNumberOfPeopleTableViewCell : UITableViewCell

@property (nonatomic, strong) ANStepperView *stepperView;

@end
