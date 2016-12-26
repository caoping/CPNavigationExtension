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

- (void)cp_setAppearanceWithBarAppearanceInfo:(CPNavigationBarAppearanceInfo *)info {
    [self cp_addBackdropEffectViewIfNeeded];
    CPNavigationBarAppearanceInfo *defaultInfo = self.cp_defaultBarAppearanceInfo;
    
    UIToolbar *backdropEffectView = [self cp_backdropEffectView];
    if (__CPNavigationExtensionSystemMajorVersion() < 10) {
        //iOS10 earlier
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        backdropEffectView.barTintColor = info.barTintColor?:defaultInfo.barTintColor;
        [CATransaction commit];
    } else {
        backdropEffectView.barTintColor = info.barTintColor?:defaultInfo.barTintColor;
    }
    
    [self setTintColor:info.tintColor?:defaultInfo.tintColor];
    [self setTitleTextAttributes:info.titleTextAttributes?:defaultInfo.titleTextAttributes];
    [self setShadowImage:info.shadowImage?:defaultInfo.shadowImage];
    [self cp_setShadowImageHidden:info.shadowImageHidden];
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

- (void)setCp_defaultBarAppearanceInfo:(CPNavigationBarAppearanceInfo *)cp_defaultBarAppearanceInfo {
    objc_setAssociatedObject(self, @selector(cp_defaultBarAppearanceInfo), cp_defaultBarAppearanceInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CPNavigationBarAppearanceInfo *)cp_defaultBarAppearanceInfo {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCp_backdropEffectView:(UIToolbar *)cp_backdropEffectView {
    objc_setAssociatedObject(self, @selector(cp_backdropEffectView), cp_backdropEffectView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIToolbar *)cp_backdropEffectView {
    UIToolbar *view = objc_getAssociatedObject(self, _cmd);
    if (!view) {
        view = [UIToolbar new];
        [self setCp_backdropEffectView:view];
        [self cp_hideOriginalBackground];
    }
    
    return view;
}

#pragma mark -

- (void)cp_addBackdropEffectViewIfNeeded {
    UIToolbar *backdropEffectView = [self cp_backdropEffectView];
    if (![backdropEffectView superview]) {
        UIView *bgView = [self cp_backgroundView];
        backdropEffectView.frame = bgView.bounds;
        backdropEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [bgView addSubview:backdropEffectView];
    }
}

- (UIView *)cp_backgroundView {
    return [self valueForKey:@"_backgroundView"];
}

- (void)cp_hideOriginalBackground {
    UIImage *image = [UIImage new];
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

#pragma mark - Helper

NSUInteger __CPNavigationExtensionSystemMajorVersion() {
    static NSUInteger _deviceSystemMajorVersion = -1;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
    });
    
    return _deviceSystemMajorVersion;
}

@end
