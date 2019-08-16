//
//  FZHBlockLinkUITests.m
//  FZHBlockLinkUITests
//
//  Created by Mac on 2019/7/30.
//  Copyright © 2019年 FZH. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface FZHBlockLinkUITests : XCTestCase

@end

@implementation FZHBlockLinkUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)loginTest
{
    
}



- (void)testExample {
    // Use recording to get started writing UI tests.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.textFields[@"\u8bf7\u8f93\u5165\u540d\u5b57"] tap];
   
    XCUIElement *textField1 = app.textFields[@"\u8bf7\u8f93\u5165\u540d\u5b57"];
    [textField1 tap];
    [textField1 typeText:@"12345"];
    
    XCUIElement *textField = app.textFields[@"\u8bf7\u8f93\u5165\u5bc6\u7801"];
    [textField tap];
    [textField typeText:@"123456"];
    
    [app.buttons[@"\u767b\u5f55"] tap];
    // Use XCTAssert and related functions to verify your tests produce the correct results.

}

@end
