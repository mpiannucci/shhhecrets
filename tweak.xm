#import <LocalAuthentication/LAContext.h>
#import <UIKit/UIKit.h>

%hook CKConversationListController

static BOOL editMode = NO;

- (void)editButtonTapped:(id)arg1 {
    editMode = !editMode;
    %orig;
}

- (void)tableView:(id)table didSelectRowAtIndexPath:(id)indexPath {

    if (!editMode) {
        LAContext *myContext = [[LAContext alloc] init];
        NSError *authError = nil;
        NSString *myLocalizedReasonString = @"This conversation is private and requires authentication";

        if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
            [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
             localizedReason:myLocalizedReasonString
            reply:^(BOOL success, NSError *error) {
                if (success) {
                    %orig;
                }
                else {
                }
            }];
        } else {
            %orig;
        }
    } else {
        %orig;
    }
}

%end