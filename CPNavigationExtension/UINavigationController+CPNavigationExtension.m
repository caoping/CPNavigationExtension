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

#import "UINavigationController+CPNavigationExtension.h"

@interface UIViewController (CPLoadViewIfNeeded)

- (void)cp_loadViewIfNeeded;

@end

@implementation UIViewController (CPLoadViewIfNeeded)

- (void)cp_loadViewIfNeeded {
    if (NSClassFromString(@"UIStackView")) {
        //iOS 9
        [self loadViewIfNeeded];
    } else {
        if (![self isViewLoaded]) {
            @try {
                UIView *v = self.view;
            } @catch (NSException *exception) {
                
            }
        }
    }
}

@end

@implementation UINavigationController (CPNavigationExtension)

- (void)cp_setNavigationBarAppearanceAfterLoadViewIfNeededWithViewController:(UIViewController *)viewController {
    if (!viewController) {
        return;
    }
    [viewController cp_loadViewIfNeeded];
    [self.navigationBar cp_setAppearanceWithBarAppearanceInfo:viewController.cp_navigationBarAppearanceInfo];
}

@end
