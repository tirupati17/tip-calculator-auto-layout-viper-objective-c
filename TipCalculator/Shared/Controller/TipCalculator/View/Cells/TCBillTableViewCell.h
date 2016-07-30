//
//  TCBillTableViewCell.h
//  TipCalculator
//
//  Created by Tirupati Balan on 28/05/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipCalculatorKeys.h"

static NSString *const TCBillTableViewCellIdentifier = @"TCBillTableViewCell";

@class MPNumericTextField;

@protocol TCBillTableViewCellDelegate <NSObject>
@optional
- (void)textDidChange:(NSString *)newValue
               forKey:(NSString *)key
               inCell:(id)sender;
- (void)textDidEnd:(NSString *)newValue
            forKey:(NSString *)key
            inCell:(id)sender;

@end

@interface TCBillTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *billTextField;
@property (nonatomic, weak) id <TCBillTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSString *billAmountString;

@end
