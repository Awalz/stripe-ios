//
//  UIBarButtonItem+Stripe.m
//  Stripe
//
//  Created by Jack Flintermann on 5/18/16.
//  Copyright © 2016 Stripe, Inc. All rights reserved.
//

#import "UIBarButtonItem+Stripe.h"

#import "STPImageLibrary+Private.h"
#import "STPImageLibrary.h"
#import "STPTheme.h"

@implementation UIBarButtonItem (Stripe)

- (void)stp_setTheme:(STPTheme *)theme {
    UIImage *image = [self backgroundImageForState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    if (image) {
        UIImage *enabledImage = [STPImageLibrary imageWithTintColor:UIColor.whiteColor forImage:image];
        UIImage *disabledImage = [STPImageLibrary imageWithTintColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] forImage:image];
        [self setBackgroundImage:enabledImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [self setBackgroundImage:disabledImage forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    
    self.tintColor = self.enabled ? UIColor.whiteColor : [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
    [self setTitleTextAttributes:@{
                                   NSFontAttributeName: self.style == UIBarButtonItemStylePlain ? theme.font : theme.emphasisFont,
                                   NSForegroundColorAttributeName: UIColor.whiteColor,
                                   }
                        forState:UIControlStateNormal];
    [self setTitleTextAttributes:@{
                                   NSFontAttributeName: self.style == UIBarButtonItemStylePlain ? theme.font : theme.emphasisFont,
                                   NSForegroundColorAttributeName: [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5],
                                   }
                        forState:UIControlStateDisabled];
}

@end

void linkUIBarButtonItemCategory(void){}

