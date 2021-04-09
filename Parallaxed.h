#import "Classes/ParallaxWallView.h"

@interface BSUIScrollView : UIScrollView
@end
  @interface SBIconScrollView : BSUIScrollView
  @property (getter=_minimumContentOffset, nonatomic, readonly) CGPoint minimumContentOffset;
  @property (getter=_maximumContentOffset, nonatomic, readonly) CGPoint maximumContentOffset;
  @property (assign, nonatomic) CGPoint contentOffset;
  @property (assign, nonatomic) CGSize contentSize;
  - (void)setContentOffset:(CGPoint)arg1;
  @end
    @interface SBFloatyFolderScrollView : SBIconScrollView
    @end

@interface SBFWindow : UIWindow
@end
  @interface SBWindow : SBFWindow
  @end
    @interface SBHomeScreenWindow : SBWindow
    - (id)_initWithScreen:(id)arg1 layoutStrategy:(id)arg2 debugName:(id)arg3 rootViewController:(id)arg4 scene:(id)arg5;
    @end

static ParallaxWallView * parallaxWallView;
