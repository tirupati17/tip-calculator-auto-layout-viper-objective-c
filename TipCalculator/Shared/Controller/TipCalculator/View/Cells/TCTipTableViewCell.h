//
//  TCTipTableViewCell.h
//  TipCalculator
//
//  Created by Tirupati Balan on 28/05/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipCalculatorKeys.h"

static NSString *const TCTipTableViewCellIdentifier = @"TCTipTableViewCell";

@class MPNumericTextField;

@protocol TCTipTableViewCellDelegate <NSObject>
@optional
- (void)textDidChange:(NSString *)newValue
               forKey:(NSString *)key
               inCell:(id)sender;
- (void)textDidEnd:(NSString *)newValue
            forKey:(NSString *)key
            inCell:(id)sender;

@end

@interface TCTipTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *tipTextField;
@property (nonatomic, weak) id <TCTipTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSString *tipAmountString;

@end
