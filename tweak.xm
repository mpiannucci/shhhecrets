#import <LocalAuthentication/LAContext.h>
#import <UIKit/UIKit.h>
#import <ChatKit/CKConversationListCell.h>
#import <ChatKit/CKConversation.h>

%hook CKConversationListController

static BOOL editMode = NO;
static BOOL firstSelect = NO;

- (void)editButtonTapped:(id)arg1 {
    editMode = !editMode;
    %orig;
}

- (void)tableView:(id)table didSelectRowAtIndexPath:(id)indexPath {

    CKConversationListCell* cell = (CKConversationListCell*)[table cellForRowAtIndexPath:indexPath];
    NSString *conversationID = [NSString stringWithFormat:@"%lu", (unsigned long)cell.hash];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];

    // TESTINGGGG
    if (!firstSelect) {
        [defaults setObject:@"test" forKey:conversationID];
        firstSelect = YES;
        [defaults synchronize];
    }

    NSString *password = [defaults objectForKey:conversationID];
    if (password == nil) {
        %orig;
        return;
    }


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
            UIAlertController *loginController = [UIAlertController alertControllerWithTitle:@"View Conversation"
                                                  message:@"This conversation is locked: Enter password to view it."
                                                  preferredStyle:UIAlertControllerStyleAlert];
            [loginController addTextFieldWithConfigurationHandler:^(UITextField *textField)
            {
                textField.placeholder = NSLocalizedString(@"Password", @"Password");
                textField.secureTextEntry = YES;
            }];

            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action)
            {
                UITextField *password = loginController.textFields.firstObject;
                if ([password.text isEqualToString:[defaults objectForKey:conversationID]]) {
                    %orig;
                }
            }];
            [loginController addAction:okAction];

            UIAlertAction *cancelAction = [UIAlertAction
                                           actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction *action)
            {
                // Deselect the table view cell
                [table deselectRowAtIndexPath:indexPath animated:YES];
            }];
            [loginController addAction:cancelAction];

            [self presentViewController:loginController animated:YES completion:nil];
        }
    } else {
        %orig;
    }
}

%end