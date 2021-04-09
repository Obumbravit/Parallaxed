#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>

@interface PXDRootListController : PSListController
@end

@interface NSUserDefaults (parallaxedprefs)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end
