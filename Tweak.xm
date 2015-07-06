%hook CKConversationListController

- (void)tableView:(id)table didSelectRowAtIndexPath:(id)indexPath {
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;

    // TODO: Call the LocalAuthentication to require TouchID
}

%end