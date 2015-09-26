#import "passwordprompt.h"

@interface PasswordPrompt ()
    @property(nonatomic, strong) UIWindow *window;
@end

@implementation passwordprompt

- (void) show {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.windowLevel = UIWindowLevelAlert;
    self.window.backgroundColor = [UIColor clearColor];

    self.center = CGPointMake(CGRectGetMidX(self.window.bounds), CGRectGetMidY(self.window.bounds));

    [self.window addSubview:self];
    [self.window makeKeyAndVisible];
}

- (void) hide {
    self.window.hidden = YES;
    self.window = nil;
}

@end