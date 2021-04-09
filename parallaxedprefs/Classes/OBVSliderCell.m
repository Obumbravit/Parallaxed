#import <Preferences/PSSpecifier.h>

#include "OBVSliderCell.h"

@implementation OBVSliderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

  if (self)
  {
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(
      15,
      12,
      0,
      20.3333
    )];
    label.text = specifier.properties[@"label"];
    label.numberOfLines = 1;
    [self.contentView addSubview:label];
    [label sizeToFit];
    [self.control setFrame:CGRectMake(
      30 + label.frame.size.width,
      0,
      self.frame.size.width - (45 + label.frame.size.width),
      self.frame.size.height
    )];
  }

    return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  [self.control setFrame:CGRectMake(
    30 + self.contentView.subviews[1].frame.size.width,
    0,
    self.frame.size.width - (45 + self.contentView.subviews[1].frame.size.width),
    self.frame.size.height
  )];
}

@end
