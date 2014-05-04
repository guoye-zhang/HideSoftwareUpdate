#import "Tweak.h"

%hook PSListController

- (NSInteger)tableView:(id)view numberOfRowsInSection:(NSInteger)section {
    if ((section == 0) && [[self specifier].identifier isEqualToString:@"General"])
        return %orig - 1;
    else
        return %orig;
}

- (id)tableView:(id)view cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ((indexPath.section == 0) && (indexPath.row > 0) && [[self specifier].identifier isEqualToString:@"General"])
        return %orig(view, [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0]);
    else
        return %orig;
}

- (void)tableView:(id)view didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ((indexPath.section == 0) && (indexPath.row > 0) && [[self specifier].identifier isEqualToString:@"General"])
        return %orig(view, [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0]);
    else
        return %orig;
}

%end
