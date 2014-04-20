@interface PSSpecifier
@property(strong, nonatomic) NSString *identifier;
@end

@interface PSListController
- (PSSpecifier *)specifier;
@end
