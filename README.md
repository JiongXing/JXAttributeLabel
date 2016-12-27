# JXAttributeLabel
Label显示不同的字体颜色
详情看这篇：http://www.jianshu.com/p/1e955cbbe5a2

继承UILabel写个类，快速设置多种字体属性。

![JXAttributeLabel.png](http://upload-images.jianshu.io/upload_images/2419179-daff122b326bda97.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

# 思路

把Label显示的内容中，属性相同的连续文字作为一个段(Section)，这样只需要对外提供两个方法，即可实现。
- 为指定的段设置属性
- 为指定的段设置文字

# 类定义
JXAttributeLabel.h
```objectivec
@interface JXAttributeLabel : UILabel

/// 设置属性，section为段号
- (void)setAttributes:(NSDictionary *)attributes atSection:(NSInteger)section;

/// 设置字符串，section为段号
- (void)setString:(NSString *)string atSection:(NSInteger)section;

@end
```

# 调用方法
我做了个Demo，在一个Label上展示四段属性随机的文字。

![JXAttributeLabel.gif](http://upload-images.jianshu.io/upload_images/2419179-9d263cb3a327bec3.gif?imageMogr2/auto-orient/strip)

```objectivec
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
```

可以看到，使用方法就是两行：
```objectivec
[self.label setAttributes:attr atSection:sectionIndex];
[self.label setString:str atSection:sectionIndex];
```
