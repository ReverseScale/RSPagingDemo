//
//  ProductDetailViewController.m
//  RSPagingDemo
//
//  Created by WhatsXie on 2017/7/31.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _scrollView.contentSize = CGSizeMake(0, 729);
}

@end
