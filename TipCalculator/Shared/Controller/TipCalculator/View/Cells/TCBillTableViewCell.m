//
//  TCBillTableViewCell.m
//  TipCalculator
//
//  Created by Tirupati Balan on 28/05/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

#import "TCBillTableViewCell.h"
#import <PureLayout/PureLayout.h>
#import <MPNumericTextField/MPNumericTextField.h>

@implementation TCBillTableViewCell

@synthesize billTextField;

@synthesize delegate;
@synthesize billAmountString = _billAmountString;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureView];
    }
    return self;
}

- (void)configureView {
    self.billTextField = [UITextField newAutoLayoutView];
    self.billTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.billTextField.font = [UIFont fontWithName:@"Verdana" size:23];
    self.billTextField.textAlignment = NSTextAlignmentCenter;
    self.billTextField.attributedPlaceholder = [self placeholder];
    self.billTextField.delegate = self;
    
    [self.contentView addSubview:self.billTextField];
    [self.contentView setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    [self.billTextField autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [super updateConstraints];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Methods

- (NSAttributedString *)placeholder {
    return [[NSAttributedString alloc] initWithString:@"Enter bill amount" attributes:@{NSFontAttributeName : [UIFont fontWithName:@"Verdana" size:23]}];
}

- (BOOL)textFieldShouldReturn:(nonnull UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(nonnull UITextField *)textField {
    _billAmountString = textField.text;
    if ([self.delegate respondsToSelector:@selector(textDidChange:forKey:inCell:)])
        [self.delegate textDidEnd:self.billAmountString forKey:BillKey inCell:self];
}

- (BOOL)textField:(nonnull UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string {
    if (string.length > 0) {
        NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
        NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
        
        BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
        if (stringIsValid) {
            _billAmountString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([self.delegate respondsToSelector:@selector(textDidChange:forKey:inCell:)])
                [self.delegate textDidChange:self.billAmountString forKey:BillKey inCell:self];
        };
        return stringIsValid;
    }
    return YES;
}

@end
