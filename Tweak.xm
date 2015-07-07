#import <UIKit/UIKit.h>

%hook CKConversationListController

bool editMode = NO;

- (void)editButtonTapped:(id)arg1 {
    editMode = !editMode;
    %orig;
}

- (void)tableView:(id)table didSelectRowAtIndexPath:(id)indexPath {

    if (!editMode) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Shhhecrets"
                                    message:@"This is a test"
                                    preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * action) {
            %orig;
        }];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        %orig;
    }
}

%end