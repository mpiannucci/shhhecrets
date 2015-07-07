#import <UIKit/UIKit.h>

%hook CKConversationListController

- (void)tableView:(id)table didSelectRowAtIndexPath:(id)indexPath {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Shhhecrets"
                                message:@"This is a test"
                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * action) {
        %orig;
    }];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

%end