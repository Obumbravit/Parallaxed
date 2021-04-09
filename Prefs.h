@interface NSUserDefaults (parallaxedprefs)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static NSString * nsDomainString = @"com.obumbravit.parallaxed";
static NSString * nsNotificationString = @"com.obumbravit.parallaxed/preferences.changed";

static BOOL ParallaxedSwitch;
static UIImage * ParallaxedImage;
static CGFloat ParallaxedDelay;
static CGFloat ParallaxedDistance;

static void notificationCallback(CFNotificationCenterRef center, void * observer, CFStringRef name, const void * object, CFDictionaryRef userInfo)
{
    NSNumber * ParallaxedSwitchh = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"ParallaxedSwitch" inDomain:nsDomainString];
    ParallaxedSwitch = (ParallaxedSwitchh) ? [ParallaxedSwitchh boolValue] : NO;
    NSData * imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"ParallaxedImage" inDomain:nsDomainString];
    ParallaxedImage = [UIImage imageWithData:imageData];
    CGFloat ParallaxedDelayy = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ParallaxedDelay" inDomain:nsDomainString] floatValue];
    ParallaxedDelay = (ParallaxedDelayy) ? ParallaxedDelayy : 0.0f;
    CGFloat ParallaxedDistancee = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ParallaxedDistance" inDomain:nsDomainString] floatValue];
    ParallaxedDistance = (ParallaxedDistancee) ? ParallaxedDistancee : 1.0f;
}
