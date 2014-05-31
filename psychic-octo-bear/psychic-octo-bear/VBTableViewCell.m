//
//  VBTableViewCell.m
//  psychic-octo-bear
//
//  Created by Ariel Rodriguez on 5/31/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "VBTableViewCell.h"
#import "NSLayoutConstraint+SelfInstall.h"

@implementation VBTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ( nil != self) {
    
        UIView *contentView = [self contentView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        [label setNumberOfLines:0];
        [label setBackgroundColor:[UIColor lightGrayColor]];
        
        [contentView addSubview:label];
        
        _label = label;
        
        NSLayoutConstraint *ltpc = [NSLayoutConstraint constraintWithItem:label
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:contentView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:11.0];
        [ltpc vb_install:UILayoutPriorityRequired];
        
        NSLayoutConstraint *ltrc = [NSLayoutConstraint constraintWithItem:contentView
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:label
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:20.0];
        [ltrc vb_install:UILayoutPriorityRequired];
        
        NSLayoutConstraint *llc = [NSLayoutConstraint constraintWithItem:label
                                                               attribute:NSLayoutAttributeLeading
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:contentView
                                                               attribute:NSLayoutAttributeLeading
                                                              multiplier:1.0
                                                                constant:20.0];
        [llc vb_install:UILayoutPriorityRequired];
        
        NSLayoutConstraint *lbc = [NSLayoutConstraint constraintWithItem:contentView
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:label
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0
                                                                constant:11.0];
        [lbc vb_install:UILayoutPriorityRequired];
        
        [label setPreferredMaxLayoutWidth:280.0f];
        
    }
    
    return self;
}


@end
