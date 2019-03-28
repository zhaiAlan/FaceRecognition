//
//  FaceDetectModel.h
//  人脸识别
//
//  Created by Alan on 2019/3/28.
//  Copyright © 2019 zhaixingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FaceDetectModel : NSObject
//人脸位置
@property(nonatomic,copy)NSString*faceFrameString;
//左眼位置
@property(nonatomic,copy)NSString*leftEyePointString;
//右眼位置
@property(nonatomic,copy)NSString*rightEyePointString;
//嘴巴位置
@property(nonatomic,copy)NSString*mouthPointString;
@property(nonatomic)BOOL isSmile;
@property(nonatomic)BOOL isLeftEyeClosed;
@property(nonatomic)BOOL isRightEyeClosed;

@end

NS_ASSUME_NONNULL_END
