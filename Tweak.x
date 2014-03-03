@interface PSSpecifier
@property(strong, nonatomic) NSString *identifier;
@end

@interface PSListController
- (PSSpecifier *)specifier;
@end

%hook PSListController

- (NSInteger)tableView:(id)view numberOfRowsInSection:(NSInteger)section {
    if ((section == 0) && [[self specifier].identifier isEqualToString:@"General"])
        return %orig(view, section) - 1;
    else
        return %orig(view, section);
}

- (id)tableView:(id)view cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ((indexPath.section == 0) && (indexPath.row > 0) && [[self specifier].identifier isEqualToString:@"General"])
        return %orig(view, [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section]);
    else
        return %orig(view, indexPath);
}

- (void)tableView:(UITableView *)view didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ((indexPath.section == 0) && (indexPath.row > 0) && [[self specifier].identifier isEqualToString:@"General"])
        return %orig(view, [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section]);
    else
        return %orig(view, indexPath);
}

%end
