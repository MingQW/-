//
//  UIImage+Utility.h
//  ImageSharer
//
//  Created by WuQingMing on 15/9/23.
//  Copyright (c) 2015年 WuQingMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utility)

+ (BOOL)save:(UIImage *)image name:(NSString *)imageName;
+ (UIImage *)get:(NSString *)name;

+ (UIImage*)fastImageWithData:(NSData*)data;
+ (UIImage*)fastImageWithContentsOfFile:(NSString*)path;

- (UIImage*)deepCopy;

- (UIImage*)resize:(CGSize)size;
- (UIImage*)aspectFit:(CGSize)size;
- (UIImage*)aspectFill:(CGSize)size;
- (UIImage*)aspectFill:(CGSize)size offset:(CGFloat)offset;

- (UIImage*)crop:(CGRect)rect;

- (UIImage*)maskedImage:(UIImage*)maskImage;

@end
