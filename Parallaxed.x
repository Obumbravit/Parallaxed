//Parallaxed by Obumbravit

@import UIKit;
#import "Parallaxed.h"
#import "Prefs.h"

%group Tweak

// Hook parent window
%hook SBHomeScreenWindow

- (id)_initWithScreen:(id)arg1 layoutStrategy:(id)arg2 debugName:(id)arg3 rootViewController:(id)arg4 scene:(id)arg5
{
  // Load default class
  SBHomeScreenWindow * orig = %orig(arg1, arg2, arg3, arg4, arg5);

  // Create Parallaxed class with empty frame
  parallaxWallView = [[ParallaxWallView alloc]initWithFrame:CGRectMake(
    0,
    0,
    0,
    0
  ) image:nil];
  [parallaxWallView setUserInteractionEnabled:NO];

  // Add Parallaxed class to default class
  [orig addSubview:parallaxWallView];
  [orig sendSubviewToBack:parallaxWallView];

  // Return default class
  return orig;
}

%end

// Hook update class
%hook SBIconScrollView

- (void)layoutSubviews
{
  %orig();

  // Check if icon list in folder
  if ([self isKindOfClass:[%c(SBFloatyFolderScrollView) class]]) return;

  // Check if container & wall are unconfigured
  if (self.contentSize.width && (parallaxWallView.frame.size.width == 0 || !parallaxWallView.wallView.image))
  {
    // Load wall
	  UIImage * wall = ParallaxedImage;

    // Set container frame
    [parallaxWallView setFrame:CGRectMake(
      0,
      0,
      self.contentSize.width,
      UIScreen.mainScreen.bounds.size.height
    )];

    // Set container image property
    [parallaxWallView setImage:wall];

    // Set wall frame
    [parallaxWallView.wallView setFrame:CGRectMake(
      self.contentOffset.x * (-1 * ((ParallaxedDistance / 10) + .5)),
      self.contentOffset.y,
      parallaxWallView.wallView.frame.size.width,
      parallaxWallView.wallView.frame.size.height
    )];
  }
}

- (void)setContentOffset:(CGPoint)arg1
{
  // Load default argument point
  CGPoint orig = arg1;

  // Call original function
  %orig(orig);

  // Check if icon list in folder
  if ([self isKindOfClass:[%c(SBFloatyFolderScrollView) class]]) return;

  // Check if wall frame already set
  if (CGRectEqualToRect(parallaxWallView.wallView.frame, CGRectMake(
    orig.x * (-1 * ((ParallaxedDistance / 10) + .5)),
    orig.y,
    parallaxWallView.wallView.frame.size.width,
    parallaxWallView.wallView.frame.size.height
  ))) return;

  // Check if over left / right boundary
  if (self.contentOffset.x < self.minimumContentOffset.x || self.contentOffset.x > self.maximumContentOffset.x) return;

  // Update wall frame with custom delay
  [UIView animateWithDuration:ParallaxedDelay animations:^{
    [parallaxWallView.wallView setFrame:CGRectMake(
      orig.x * (-1 * ((ParallaxedDistance / 10) + .5)),
      orig.y,
      parallaxWallView.wallView.frame.size.width,
      parallaxWallView.wallView.frame.size.height
    )];
  }];
}

%end

%end

// Post-respring calls
%ctor
{
  // Load prefs
  notificationCallback(NULL, NULL, NULL, NULL, NULL);
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);

  // Initialize if tweak enabled
  if (ParallaxedSwitch) %init(Tweak);
}
