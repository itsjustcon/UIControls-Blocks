#import "/usr/include/objc/runtime.h"

typedef void (^EmptyBlock)();
static char UIButtonBlockKey;

@interface UIButton (UIBlockButton)
- (void)handleControlEvent:(UIControlEvents)event withBlock:(EmptyBlock)block;
- (void)callBlock:(id)sender;
@end


@implementation UIButton (UIBlockButton)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(EmptyBlock)block {
	objc_setAssociatedObject(self, &UIButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
	[self addTarget:self action:@selector(callBlock:) forControlEvents:event];
}

- (void)callBlock:(id)sender {
	EmptyBlock block = (EmptyBlock)objc_getAssociatedObject(self, &UIButtonBlockKey);
	if (block) block();
}

- (void)dealloc {
	objc_removeAssociatedObjects(self);
}

@end