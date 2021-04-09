#import <UIKit/UIKit.h>
#import <Preferences/PSControlTableCell.h>
#import <spawn.h>
#import <notify.h>

#include "PXDRootListController.h"

@implementation PXDRootListController

- (NSArray *)specifiers
{
	if (!_specifiers) _specifiers = [self loadSpecifiersFromPlistName:@"parallaxedprefs" target:self];
	return _specifiers;
}

- (id)init
{
	self = [super init];
	if (self) self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(apply)];
	return self;
}

- (void)apply
{
	[self.view endEditing:YES];

  if (![[NSUserDefaults standardUserDefaults] objectForKey:@"ParallaxedImage" inDomain:@"com.obumbravit.parallaxed"])
  {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Parallaxed"
      message:@"No Wallpaper Selected!\nPlease Choose an Image and Try Again."
  	  preferredStyle:UIAlertControllerStyleAlert];

  	UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
  	[self presentViewController:alert animated:YES completion:nil];
  }
  else
  {
  	UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Parallaxed"
      message:@"Settings Applied!\nYour Device Will Now Respring."
  	  preferredStyle:UIAlertControllerStyleAlert];

  	UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
    {
  		pid_t pid;
  		if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/bin/sbreload"])
  		{
      		const char* args[] = {"sbreload", NULL};
      		posix_spawn(
            &pid,
            "/usr/bin/sbreload",
            NULL,
            NULL,
            (char* const*)args,
            NULL
          );
  		}
  		else
  		{
      		const char* args[] = {"killall", "-9", "backboardd", NULL};
      		posix_spawn(
            &pid,
            "/usr/bin/killall",
            NULL,
            NULL,
            (char* const*)args,
            NULL
          );
  		};
  	}];

    [alert addAction:defaultAction];
  	[self presentViewController:alert animated:YES completion:nil];
  }
}

- (void)twitter
{
	NSURL *url;
	if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]]) url = [NSURL URLWithString:@"tweetbot:///user_profile/Obumbravit"];
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]]) url = [NSURL URLWithString:@"twitterrific:///profile?screen_name=Obumbravit"];
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]]) url = [NSURL URLWithString:@"tweetings:///user?screen_name=Obumbravit"];
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]]) url = [NSURL URLWithString:@"twitter://user?screen_name=Obumbravit"];
	else url = [NSURL URLWithString:@"https://mobile.twitter.com/Obumbravit"];
	[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

- (void)kofi
{
	NSURL *url;
	if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"kofi:"]]) url = [NSURL URLWithString:@"https://ko-fi.com/obumbravit"];
	else url = [NSURL URLWithString:@"https://ko-fi.com/obumbravit"];
	[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

@end
