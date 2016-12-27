//
//  JXAttributeLabel.m
//  JXAttributeLabelDemo
//
//  Created by JiongXing on 2016/12/26.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import "JXAttributeLabel.h"

@interface JXAttributeLabel ()

@property (nonatomic, strong) NSMutableArray<NSDictionary *> *attributesArray;

@property (nonatomic, strong) NSMutableArray<NSString *> *stringArray;

@end

@implementation JXAttributeLabel

- (void)setAttributes:(NSDictionary *)attributes atSection:(NSInteger)section {
    if (!attributes) {
        attributes = [NSDictionary dictionary];
    }
    if (self.attributesArray.count < section + 1) {
        [self fillAttributesArrayToCount:section + 1];
    }
    self.attributesArray[section] = attributes;
    [self reloadData];
}

- (void)setString:(NSString *)string atSection:(NSInteger)section {
    if (!string) {
        string = @"";
    }
    if (self.stringArray.count < section + 1) {
        [self fillStringArrayToCount:section + 1];
    }
    self.stringArray[section] = string;
    [self reloadData];
}

- (void)fillAttributesArrayToCount:(NSInteger)count {
    NSInteger delta = count - self.attributesArray.count;
    for (NSInteger index = 0; index < delta; index ++) {
        [self.attributesArray addObject:[NSDictionary dictionary]];
    }
}

- (void)fillStringArrayToCount:(NSInteger)count {
    NSInteger delta = count - self.stringArray.count;
    for (NSInteger index = 0; index < delta; index ++) {
        [self.stringArray addObject:@""];
    }
}

- (void)reloadData {
    NSMutableAttributedString *mutAttrStr = [[NSMutableAttributedString alloc] init];
    for (NSInteger index = 0; index < self.stringArray.count; index ++) {
        NSString *string = self.stringArray[index];
        if (self.attributesArray.count < index + 1) {
            [self fillAttributesArrayToCount:index + 1];
        }
        NSDictionary *attributes = self.attributesArray[index];
        NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attributes];
        [mutAttrStr appendAttributedString:attrStr];
    }
    self.attributedText = mutAttrStr;
}

- (NSMutableArray<NSDictionary *> *)attributesArray {
    if (!_attributesArray) {
        _attributesArray = [NSMutableArray array];
    }
    return _attributesArray;
}

- (NSMutableArray<NSString *> *)stringArray {
    if (!_stringArray) {
        _stringArray = [NSMutableArray array];
    }
    return _stringArray;
}

@end
