%hook CKConversationListController

- (void)tableView:(id)table didSelectRowAtIndexPath:(id)indexPath {
    UIAlertController* lockAlert = [UIAlertController alertControllerWithTitle:@"Shhhecret thread"
                                    message:@"This is locked! Do not enter!"
                                    preferredStyle:UIAlertControllerStyleAlert];

    [self presentViewController:lockAlert animated:YES completion:nil];
    [lockAlert release];
}

%end