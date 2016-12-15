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

#import "UINavigationItem+CPNavigationExtension.h"
#import <objc/runtime.h>

@implementation UINavigationItem (CPNavigationExtension)

#pragma mark - Associated Object

- (void)setCp_tintColor:(UIColor *)cp_tintColor {
    objc_setAssociatedObject(self, @selector(cp_tintColor), cp_tintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)cp_tintColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCp_barTintColor:(UIColor *)cp_barTintColor {
    objc_setAssociatedObject(self, @selector(cp_barTintColor), cp_barTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)cp_barTintColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCp_titleTextAttributes:(NSDictionary *)cp_titleTextAttributes {
    objc_setAssociatedObject(self, @selector(cp_titleTextAttributes), cp_titleTextAttributes, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)cp_titleTextAttributes {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCp_shadowImage:(UIImage *)cp_shadowImage {
    objc_setAssociatedObject(self, @selector(cp_shadowImage), cp_shadowImage, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIImage *)cp_shadowImage {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCp_shadowImageHidden:(BOOL)cp_shadowImageHidden {
    objc_setAssociatedObject(self, @selector(cp_shadowImageHidden), @(cp_shadowImageHidden), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)cp_shadowImageHidden {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end
