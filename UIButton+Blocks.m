#import "UIButton+Blocks.h"

@implementation UIButton (UIBlockButton)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(EmptyBlock)block {
	objc_setAssociatedObject(self, &UIButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
	[self addTarget:self action:@selector(callBlock:) forControlEvents:event];
}

- (void)callBlock:(id)sender {
	EmptyBlock block = (EmptyBlock)objc_getAssociatedObject(self, &UIButtonBlockKey);
	if (block) block();
}

@end