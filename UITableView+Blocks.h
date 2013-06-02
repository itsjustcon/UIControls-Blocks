#import <objc/runtime.h>

// typedef returnType (^typedefName)(parameters);
typedef UITableViewCell* (^CreateTableCellBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef void (^SelectTableCellBlock)(UITableView *tableView, NSIndexPath *indexPath);
static char RowsKey, CreateCellKey, SelectCellKey;

@interface UITableView (UIBlockTableView) <UITableViewDataSource, UITableViewDelegate>
- (void)setNumberOfRows:(NSInteger)rows;
- (void)setNumberOfRowsInSections:(NSArray *)rows;
- (void)handleCellCreationWithBlock:(CreateTableCellBlock)block;
- (void)handleCellSelectionWithBlock:(SelectTableCellBlock)block;
@end