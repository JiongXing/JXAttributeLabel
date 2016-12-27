//
//  ViewController.m
//  JXAttributeLabelDemo
//
//  Created by JiongXing on 2016/12/26.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import "ViewController.h"
#import "JXAttributeLabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet JXAttributeLabel *label;

@property (nonatomic, strong) NSArray *stringArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stringArray = @[@"人在爱欲之中，", @"独生独死，独去独来，", @"苦乐自当，", @"无有代者。"];
    [self touchReset:nil];
}

- (IBAction)touchReset:(UIButton *)sender {
    NSDictionary *attr = [self randomAttribute];
    [self.label setAttributes:attr atSection:0];
    [self.label setAttributes:attr atSection:1];
    [self.label setAttributes:attr atSection:2];
    [self.label setAttributes:attr atSection:3];
    
    NSString *str0 = self.stringArray[0];
    NSString *str1 = self.stringArray[1];
    NSString *str2 = self.stringArray[2];
    NSString *str3 = self.stringArray[3];
    [self.label setString:str0 atSection:0];
    [self.label setString:str1 atSection:1];
    [self.label setString:str2 atSection:2];
    [self.label setString:str3 atSection:3];
}

- (IBAction)touchSection0:(UIButton *)sender {
    [self setRandomContentWithSectionIndex:0];
}

- (IBAction)touchSection1:(UIButton *)sender {
    [self setRandomContentWithSectionIndex:1];
}

- (IBAction)touchSection2:(UIButton *)sender {
    [self setRandomContentWithSectionIndex:2];
}

- (IBAction)touchSection3:(UIButton *)sender {
    [self setRandomContentWithSectionIndex:3];
}

- (void)setRandomContentWithSectionIndex:(NSInteger)sectionIndex {
    NSDictionary *attr = [self randomAttribute];
    NSString *str = [self randomString];
    [self.label setAttributes:attr atSection:sectionIndex];
    [self.label setString:str atSection:sectionIndex];
}

- (NSDictionary *)randomAttribute {
    NSInteger fontSize = arc4random_uniform(6) + 12;
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    UIColor *color = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.0];
    return @{NSFontAttributeName : font,
             NSForegroundColorAttributeName : color};
}

- (NSString *)randomString {
    NSInteger index = arc4random_uniform(4);
    return self.stringArray[index];
    
}

@end
