//
//  TCTipTableViewCell.m
//  TipCalculator
//
//  Created by Tirupati Balan on 28/05/16.
//  Copyright © 2016 CelerStudio. All rights reserved.
//

#import "TCTipTableViewCell.h"
#import <PureLayout/PureLayout.h>
#import <MPNumericTextField/MPNumericTextField.h>

@implementation TCTipTableViewCell 

@synthesize tipTextField;
@synthesize delegate;
@synthesize tipAmountString = _tipAmountString;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureView];
    }
    return self;
}

- (void)configureView {
    self.tipTextField = [UITextField newAutoLayoutView];
    self.tipTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.tipTextField.font = [UIFont fontWithName:@"Verdana" size:23];
    self.tipTextField.textAlignment = NSTextAlignmentCenter;
    self.tipTextField.attributedPlaceholder = [self placeholder];
    self.tipTextField.delegate = self;
    [self.contentView addSubview:self.tipTextField];
    [self.contentView setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    [self.tipTextField autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    [super updateConstraints];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Methods

- (NSAttributedString *)placeholder {
    return [[NSAttributedString alloc] initWithString:@"Enter tip %" attributes:@{NSFontAttributeName : [UIFont fontWithName:@"Verdana" size:23]}];
}

- (BOOL)textFieldShouldReturn:(nonnull UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(nonnull UITextField *)textField {
    _tipAmountString = textField.text;
    if ([self.delegate respondsToSelector:@selector(textDidChange:forKey:inCell:)])
        [self.delegate textDidEnd:self.tipAmountString forKey:TipKey inCell:self];
}

- (BOOL)textField:(nonnull UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string {
    if (string.length > 0) {
        NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
        NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
        
        BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
        if (stringIsValid) {
            _tipAmountString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            if ([self.delegate respondsToSelector:@selector(textDidChange:forKey:inCell:)])
                [self.delegate textDidChange:self.tipAmountString forKey:TipKey inCell:self];
        };
        return stringIsValid;
    }
    return YES;
}

@end
