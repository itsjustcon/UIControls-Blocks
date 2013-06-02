#import "UIPickerView+Blocks.h"

@implementation UIPickerView (UIBlockPickerView)

- (void)setTitles:(NSArray *)titles {
	objc_setAssociatedObject(self, &TitlesKey, titles, OBJC_ASSOCIATION_COPY_NONATOMIC);
	[self setDataSource:self];
	[self setDelegate:self];
}

- (void)handleSelectionWithBlock:(SelectionBlock)block {
	objc_setAssociatedObject(self, &SelectBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
	[self setDelegate:self];
}

#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	NSArray *ary = (NSArray *)objc_getAssociatedObject(self, &TitlesKey);
	return [ary count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	NSArray *ary = (NSArray *)objc_getAssociatedObject(self, &TitlesKey);
	return [ary[component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	NSArray *ary = (NSArray *)objc_getAssociatedObject(self, &TitlesKey);
	return ary[component][row];
}

#pragma mark UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	SelectionBlock block = (SelectionBlock)objc_getAssociatedObject(self, &SelectBlockKey);
	if (block) block(pickerView, row, component);
}

@end