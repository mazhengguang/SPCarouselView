//
//  ViewController.m
//  SPCarouselView
//
//  Created by Libo on 17/5/4.
//  Copyright © 2017年 iDress. All rights reserved.
//

#import "ViewController.h"
#import "SPCarouselView.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, SPCarouselViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *localPhotos;

@property (nonatomic, strong) NSArray *urlPhotos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    // 本地图片数组
    self.localPhotos = @[@"景1.jpg",@"景2.jpg",@"景3.jpg",@"景4.jpg",@"景5.jpg"];
    
    // 网络图片数组
    self.urlPhotos = @[
                       @"http://pic34.nipic.com/20131028/2455348_171218804000_2.jpg",
                       @"http://img1.3lian.com/2015/a2/228/d/129.jpg",
                       @"http://img.boqiicdn.com/Data/Bbs/Pushs/img79891399602390.jpg",
                       @"http://sc.jb51.net/uploads/allimg/150703/14-150F3164339355.jpg",
                       @"http://img1.3lian.com/2015/a2/243/d/187.jpg",
                       @"http://www.xiumeitu.net/uploads/allimg/150413/1-15041323004K47.jpg",
                       @"http://pic7.nipic.com/20100503/1792030_163333013611_2.jpg",
                       @"http://www.microfotos.com/pic/0/90/9023/902372preview4.jpg",
                       @"http://pic1.win4000.com/wallpaper/b/55b9e2271b119.jpg"
                       ];
    
    // 示例1
    //[self localTest1];
    
    // 示例2
    //[self localTest2];
    
    // 示例3
    //[self urlTest1];
    
    // 示例4
    [self urlTest2];
}

#pragma mark - 本地图片示例
// 示例1    本地图片,类方法创建
- (void)localTest1 {

    SPCarouselView *carouselView = [SPCarouselView carouselScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, 200) localImages:self.localPhotos];
    // 属性设置
    [self setupPropertyForCarouselView:carouselView];
    self.tableView.tableHeaderView = carouselView;
}

// 示例2    本地图片,alloc init创建
- (void)localTest2 {
    SPCarouselView *carouselView = [[SPCarouselView alloc] init];
    carouselView.frame = CGRectMake(0, 0, kScreenWidth, 200);
    [self setupPropertyForCarouselView:carouselView];
    self.tableView.tableHeaderView = carouselView;
    
    carouselView.localImages = self.localPhotos;
}

#pragma mark - 网络图片示例
// 示例3    网络图片,类方法创建
- (void)urlTest1 {
    SPCarouselView *carouselView = [SPCarouselView carouselScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, 200) urlImages:self.urlPhotos];
    // 属性设置
    [self setupPropertyForCarouselView:carouselView];
    self.tableView.tableHeaderView = carouselView;
}

// 示例4    网络图片,alloc init创建
- (void)urlTest2 {
    SPCarouselView *carouselView = [[SPCarouselView alloc] init];
    carouselView.frame = CGRectMake(0, 0, kScreenWidth, 200);
    
    [self setupPropertyForCarouselView:carouselView];
    
    self.tableView.tableHeaderView = carouselView;
    
    carouselView.urlImages = self.urlPhotos;
}

// 设置轮播图属性
- (void)setupPropertyForCarouselView:(SPCarouselView *)carouselView {
    // 代理
    carouselView.delegate = self;
    // 轮播图切换时间
    //carouselView.duration = 5.0f;
    // 是否自动轮播
    //carouselView.autoScroll = NO;
    // page小圆点颜色
    //carouselView.pageColor = [UIColor whiteColor];
    // 当前page小圆点颜色
    //carouselView.currentPageColor = [UIColor redColor];
    // pageControl的位置,默认底部中心
    //carouselView.pageControlPosition = SPPageContolPositionBottomRight;
    // 是否显示pageControl
    //carouselView.showPageControl = NO;
    // 设置轮播图图片的展示模式
    //carouselView.imageMode = SPCarouselViewImageModeScaleAspectFit;
    // 设置小圆点图片
    //[carouselView setPageImage:[UIImage imageNamed:@"笑脸yellow.png"] currentPageImage:[UIImage imageNamed:@"笑脸red.png"]];
}

#pragma mark - SPCarouselViewDelegate
- (void)carouselView:(SPCarouselView *)carouselView clickedImageAtIndex:(NSUInteger)index {
    NSLog(@"点击了第%zd张图片",index);
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行",indexPath.row];
    return cell;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
