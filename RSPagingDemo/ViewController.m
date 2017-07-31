//
//  ViewController.m
//  RSPagingDemo
//
//  Created by WhatsXie on 2017/7/31.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+RSPaging.h"
#import "ProductDetailViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.scrollView.contentSize = CGSizeMake(0, self.view.frame.size.height - 44);
    
    ProductDetailViewController *detailVC = [[ProductDetailViewController alloc] init];
    [self addChildViewController:detailVC];
    
    if (detailVC.view != nil) {
        self.scrollView.pagingScrollView = detailVC.scrollView;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
