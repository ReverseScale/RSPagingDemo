//
//  UIScrollView+RSPaging.m
//  RSPagingDemo
//
//  Created by WhatsXie on 2017/7/31.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <MJRefresh.h>
#import "UIScrollView+RSPaging.h"

static const float kAnimationDuration = 0.25f;

static const char rs_originContentHeight;
static const char rs_pagingScrollView;

@interface UIScrollView ()
@property (nonatomic, assign) float originContentHeight;
@end

@implementation UIScrollView (RSPaging)
- (void)setOriginContentHeight:(float)originContentHeight {
    objc_setAssociatedObject(self, &rs_originContentHeight, @(originContentHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (float)originContentHeight {
    return [objc_getAssociatedObject(self, &rs_originContentHeight) floatValue];
}


- (void)setFirstScrollView:(UIScrollView *)firstScrollView {
    [self addFirstScrollViewFooter];
}

- (UIScrollView *)pagingScrollView {
    return objc_getAssociatedObject(self, &rs_pagingScrollView);
}

- (void)setPagingScrollView:(UIScrollView *)pagingScrollView {
    objc_setAssociatedObject(self, &rs_pagingScrollView, pagingScrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addFirstScrollViewFooter];
    
    CGRect frame = self.bounds;
    frame.origin.y = self.contentSize.height + self.footer.frame.size.height;
    pagingScrollView.frame = frame;
    
    [self addSubview:pagingScrollView];
    
    [self addpagingScrollViewHeader];
}

- (void)addFirstScrollViewFooter {
    __weak __typeof(self) weakSelf = self;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf endFooterRefreshing];
    }];
    footer.appearencePercentTriggerAutoRefresh = 2;
    [footer setTitle:@"继续拖动,查看图文详情" forState:MJRefreshStateIdle];
    
    self.footer = footer;
}

- (void)addpagingScrollViewHeader {
    __weak __typeof(self) weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf endHeaderRefreshing];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"下拉,返回宝贝详情" forState:MJRefreshStateIdle];
    [header setTitle:@"释放,返回宝贝详情" forState:MJRefreshStatePulling];
    
    self.pagingScrollView.header = header;
}

- (void)endFooterRefreshing {
    [self.footer endRefreshing];
    self.footer.hidden = YES;
    self.scrollEnabled = NO;
    
    self.pagingScrollView.header.hidden = NO;
    self.pagingScrollView.scrollEnabled = YES;
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.contentInset = UIEdgeInsetsMake(-self.contentSize.height - self.footer.frame.size.height, 0, 0, 0);
    }];
    
    self.originContentHeight = self.contentSize.height;
    self.contentSize = self.pagingScrollView.contentSize;
}

- (void)endHeaderRefreshing {
    [self.pagingScrollView.header endRefreshing];
    self.pagingScrollView.header.hidden = YES;
    self.pagingScrollView.scrollEnabled = NO;
    
    self.scrollEnabled = YES;
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.contentInset = UIEdgeInsetsMake(0, 0, self.footer.frame.size.height, 0);
    }];
    self.contentSize = CGSizeMake(0, self.originContentHeight);
    
    [self setContentOffset:CGPointZero animated:YES];
    
    [self addFirstScrollViewFooter];
}

@end
