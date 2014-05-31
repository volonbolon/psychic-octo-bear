//
//  VBTableViewCell.m
//  psychic-octo-bear
//
//  Created by Ariel Rodriguez on 5/31/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "VBTableViewCell.h"

@implementation VBTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
