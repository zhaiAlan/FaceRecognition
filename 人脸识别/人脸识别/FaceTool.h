//
//  FaceTool.h
//  人脸识别
//
//  Created by Alan on 2019/3/28.
//  Copyright © 2019 zhaixingzhi. All rights reserved.
//

#pragma mark touchID代码示例
/*
 FaceTool*tools=[[FaceTool alloc]initWithTouchID_Block:^(touchIDENUM x) {
 switch (x) {
 case touchIDCheCkCancel:
 NSLog(@"取消");
 break;
 case touchIDCheckPassWord:
 NSLog(@"手动输入密码");
 
 break;
 case touchIDCheckSucceed:
 NSLog(@"验证成功");
 
 break;
 case touchIDDeviceError:
 NSLog(@"无法启动touid");
 
 break;
 }
 }];
 tools=nil;
 */


#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import "FaceDetectModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    touchIDDeviceError=0,
    touchIDCheckSucceed,
    touchIDCheCkCancel,
    touchIDCheckPassWord
} touchIDENUM;



@interface FaceTool : NSObject
//指纹block
@property(nonatomic,copy)void(^touchIDBlock)(touchIDENUM);
//人脸识别block
@property(nonatomic,copy)void(^faceDetectBlock)(BOOL,NSArray*);
//人脸识别的imageView
@property(nonatomic,assign)UIImageView*headerImageView;
//iOS8  指纹验证
-(instancetype)initWithTouchID_Block:(void(^)(touchIDENUM))a;
//iOS7  图像识别
-(instancetype)initWithFaceDetectWithImageView:(UIImageView*)headerImageView Block:(void(^)(BOOL,NSArray*))b;


@end

NS_ASSUME_NONNULL_END
