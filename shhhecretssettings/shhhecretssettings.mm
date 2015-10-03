#import <Preferences/Preferences.h>

@interface shhhecretssettingsListController : PSListController {
}
@end

@implementation shhhecretssettingsListController
- (id)specifiers {
    if(_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"shhhecretssettings" target:self] retain];
    }
    return _specifiers;
}
@end

// vim:ft=objc
