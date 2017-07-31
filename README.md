# RSPagingDemo
实现淘宝详情页下拉展示效果 Demo

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-791K-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

实现淘宝商品详情页，下拉展示效果，实现简单，封装结构，高解耦性。

| 名称 |1.列表页 |2.展示页 |3.结果页 |
| ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-31/57758553.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-31/4575330.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-31/63399370.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 正常展示 | 下拉展示 |


## Advantage 框架的优势
* 1.文件少，代码简洁
* 2.不依赖任何其他第三方库
* 3.封装实现，高解耦性
* 4.具备较高自定义性


## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 第一步 引入头文件
``` Objective-C
#import "UIScrollView+RSPaging.h"
#import "ProductDetailViewController.h" //下半部分的ViewController
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end
```
### 第二步 简单调用
``` Objective-C
self.edgesForExtendedLayout = UIRectEdgeNone;
self.scrollView.contentSize = CGSizeMake(0, self.view.frame.size.height - 44);
ProductDetailViewController *detailVC = [[ProductDetailViewController alloc] init];
[self addChildViewController:detailVC];
    
if (detailVC.view != nil) {
    self.scrollView.pagingScrollView = detailVC.scrollView;
}

```

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
RSPagingDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
