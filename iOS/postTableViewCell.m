//
//  postTableViewCell.m
//  sampletweet
//
//  Created by Htain Lin Shwe on 14/3/13.
//  Copyright (c) 2013 comquas. All rights reserved.
//

#import "postTableViewCell.h"
#import "Post.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"

@implementation postTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.textColor = [UIColor darkGrayColor];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    self.detailTextLabel.numberOfLines = 0;
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return self;
}

- (void)setPost:(Post *)post {
    _post = post;
    
    self.textLabel.text = _post.user.username;
    self.detailTextLabel.text = _post.message;
    [self.imageView setImageWithURL:_post.user.avatarImageURL placeholderImage:[UIImage imageNamed:@"profile-image-placeholder"]];

    [self setNeedsLayout];
}

+ (CGFloat)heightForCellWithPost:(Post *)post {
    CGSize sizeToFit = [post.message sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(220.0f, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    
    return fmaxf(70.0f, sizeToFit.height + 45.0f);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
    self.textLabel.frame = CGRectMake(70.0f, 10.0f, 240.0f, 20.0f);
    
    CGRect detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0.0f, 25.0f);
    detailTextLabelFrame.size.height = [[self class] heightForCellWithPost:_post] - 45.0f;
    
    self.detailTextLabel.frame = detailTextLabelFrame;
}

@end
