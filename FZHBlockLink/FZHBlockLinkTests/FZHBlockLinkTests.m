//
//  FZHBlockLinkTests.m
//  FZHBlockLinkTests
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface FZHBlockLinkTests : XCTestCase
@property (nonatomic, strong) ViewController *vc;
@end

@implementation FZHBlockLinkTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vc = [[ViewController alloc] init];
}
//单元测试 逻辑互不影响 + 单一变量原则
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.vc = nil;
}

#pragma mark 逻辑测试
- (void)testLOG
{
    //1.given 测试需要的条件
    NSInteger numq = 10;
    NSInteger nub2 = 20;
    
    //2.when
    NSInteger num3 = [self.vc plus:numq numb:nub2]; //10 + 20 = 30
    
    //3.then
    XCTAssertEqual(num3, 50,@"😭，闹，上吊");
}

//性能测试
- (void)testPerformanceExample2
{
    //ARKit 2 测量工具
    //Metal 渲染
    
    [self measureBlock:^{//time 200/10 等分取样法 cpu
        [self.vc loadManyDatas];
    }];
    
}


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
    
    //臃肿 细微
    
    //内存 +时间 +耗电量 + 流量 + 发热量
    [self measureMetrics:@[XCTPerformanceMetric_WallClockTime] automaticallyStartMeasuring:NO forBlock:^{
        
        [self.vc loadManyDatas];
        [self startMeasuring]; //时间 * 2
        //do that thing you want to mease
        [self.vc loadManyDatas];
        [self stopMeasuring];
    }];
    
}

#pragma mark - 异步测试
- (void)testAsync{
    
    //given
    XCTestExpectation *exp = [self expectationWithDescription:@"达不到期望"];
    
    //when
    [self.vc requestdata:^(id data) {
        //复合
        
        XCTAssertNotNil(data,@"不能为空");
        [exp fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1.2 handler:^(NSError * _Nullable error) {
        NSLog(@"error:%@",error);
    }];
    
}

@end
