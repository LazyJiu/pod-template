//
//  BKNavigationViewController.m
//  Booking_Travel
//
//  Created by QY_Samuel on 16/7/1.
//  Copyright © 2016年 Samuel. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIImage+Extension.h"
#import "UIView+Extension.h"
#import "EBColor.h"

@interface BaseNavigationController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>
@end

@implementation BaseNavigationController

+ (void)initialize
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName:Color.contrast,NSFontAttributeName:[UIFont systemFontOfSize:20]};
    navigationBar.barTintColor = Color.theme;
    [navigationBar setTitleTextAttributes:attributes];
    
    [navigationBar setTranslucent:NO];
  
    [navigationBar setShadowImage:[UIImage new]];
    
    [navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    barItem.tintColor = Color.contrast;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
        self.delegate = self;
    }
    
    
    
}



- (UIStatusBarStyle)preferredStatusBarStyle {
    return Color.barStyle;
}



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //大于0 表示不是根控制器
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        //        //设置返回按钮样式
        viewController.navigationItem.leftBarButtonItem = [self createWithTarget:self action:@selector(back) image:@"common_leftback" highImage:@"common_leftback"];

    }
    
    [super pushViewController:viewController animated:animated];
    
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}



- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated {
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = [navigationController.viewControllers count] != 1;
    }
}


- (UIBarButtonItem *)createWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tintColor = Color.contrast;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [button setImage:[[UIImage imageNamed:highImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]  forState:UIControlStateHighlighted];
    
    button.size = button.currentImage.size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return  [self.topViewController preferredInterfaceOrientationForPresentation];
}


@end

