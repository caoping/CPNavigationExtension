// The MIT License (MIT)
//
// Copyright (c) 2016 caoping <caoping.dev@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "UINavigationBar+CPNavigationExtension.h"
#import <objc/runtime.h>

@implementation UINavigationBar (CPNavigationExtension)

#pragma mark - Public Methods

- (void)cp_setAppearanceWithNavigationItem:(UINavigationItem *)item {
    [self setTintColor:item.cp_tintColor?:self.cp_defaultTintColor];
    [self setBarTintColor:item.cp_barTintColor?:self.cp_defaultBarTintColor];
    [self setTitleTextAttributes:item.cp_titleTextAttributes?:self.cp_defaultTitleTextAttributes];
    [self setShadowImage:item.cp_shadowImage?:self.cp_defaultShadowImage];
    [self cp_setShadowImageHidden:item.cp_shadowImageHidden];
}

- (void)cp_setShadowImageHidden:(BOOL)shadowImageHidden {
    SEL sel = NSSelectorFromString(@"_setHidesShadow:");
    NSMethodSignature *signature = [self methodSignatureForSelector:sel];
    if (signature) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setSelector:sel];
        [invocation setArgument:&shadowImageHidden atIndex:2];
        [invocation invokeWithTarget:self];
    }
}

#pragma mark - Associated Object

- (void)setCp_defaultTintColor:(UIColor *)cp_defaultTintColor {
    objc_setAssociatedObject(self, @selector(cp_defaultTintColor), cp_defaultTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)cp_defaultTintColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCp_defaultBarTintColor:(UIColor *)cp_defaultBarTintColor {
    objc_setAssociatedObject(self, @selector(cp_defaultBarTintColor), cp_defaultBarTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)cp_defaultBarTintColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCp_defaultTitleTextAttributes:(NSDictionary *)cp_defaultTitleTextAttributes {
    objc_setAssociatedObject(self, @selector(cp_defaultTitleTextAttributes), cp_defaultTitleTextAttributes, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)cp_defaultTitleTextAttributes {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCp_defaultShadowImage:(UIImage *)cp_defaultShadowImage {
    objc_setAssociatedObject(self, @selector(cp_defaultShadowImage), cp_defaultShadowImage, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIImage *)cp_defaultShadowImage {
    return objc_getAssociatedObject(self, _cmd);
}

@end
