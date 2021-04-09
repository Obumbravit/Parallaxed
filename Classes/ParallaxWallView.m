#include "ParallaxWallView.h"

@implementation ParallaxWallView

- (id)initWithFrame:(CGRect)arg1 image:(UIImage *)arg2
{
	self = [super initWithFrame:arg1];

	if (self)
	{
    UIImage * wall = arg2;
    self.wallView = [[UIImageView alloc] initWithImage:wall];
    [self.wallView setFrame:self.frame];
    [self.wallView setClipsToBounds:YES];
    [self.wallView setContentMode:UIViewContentModeScaleAspectFill];
    [self addSubview:self.wallView];
	}

	return self;
}

- (void)setFrame:(CGRect)arg1
{
  [super setFrame:arg1];
  [self.wallView setFrame:arg1];
}

- (void)setImage:(UIImage *)arg1
{
  [self.wallView setImage:arg1];
}

@end
