@interface PSSpecifier
@property(strong, nonatomic) NSString *identifier;
@end

@interface PSListController
- (PSSpecifier *)specifier;
@end

%hook PSListController

- (NSInteger)tableView:(id)view numberOfRowsInSection:(NSInteger)section {
    if ([[self specifier].identifier isEqualToString:@"General"] && (section == 0))
        return 1;
    else
        return %orig(view, section);
}

%end
