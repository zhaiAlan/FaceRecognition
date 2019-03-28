//
//  ViewController.m
//  人脸识别
//
//  Created by Alan on 2019/3/28.
//  Copyright © 2019 zhaixingzhi. All rights reserved.
//

#import "ViewController.h"
#import "FaceTool.h"

@interface ViewController ()
{
    UIImageView*_imageView;
    
}
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView=[[UIImageView alloc]initWithFrame:self.view.frame];
        _imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",arc4random()%109]];
    }
    return _imageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建导航
    [self.view addSubview:self.imageView];
    [self createView];

    [self recognitionFace];
    // Do any additional setup after loading the view.
}
-(void)createView{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame=CGRectMake(0, 0, 40, 40);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)recognitionFace{
    //识别一张图片大约消耗500ms
    
    typeof(_imageView) __weak weakImageView = _imageView;
    FaceTool*tools=[[FaceTool alloc]initWithFaceDetectWithImageView:_imageView Block:^(BOOL isSucceed, NSArray *array) {
        if (isSucceed) {
            for (FaceDetectModel*model in array) {
                //ZCFaceDetectModel模型中描述了脸、左眼、右眼、嘴
                //脸
                UIView*face=[[UIView alloc]initWithFrame:CGRectFromString(model.faceFrameString)];
                face.backgroundColor=[UIColor redColor];
                face.alpha=0.2;
                [weakImageView addSubview:face];
                
                //左眼
                UIView*leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
                
                leftView.center=CGPointFromString(model.leftEyePointString);
                leftView.backgroundColor=[UIColor blueColor];
                [weakImageView addSubview:leftView];
                //右眼
                UIView*rightView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
                rightView.center=CGPointFromString(model.rightEyePointString);
                rightView.backgroundColor=[UIColor yellowColor];
                [weakImageView addSubview:rightView];
                
                //嘴
                UIView*mouth=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
                mouth.backgroundColor=[UIColor purpleColor];
                mouth.center=CGPointFromString(model.mouthPointString);
                [weakImageView addSubview:mouth];
                
                
                NSLog(@"是否微笑%d~~左眼%d~~右眼%d",model.isSmile,model.isLeftEyeClosed,model.isRightEyeClosed);
                
            }
            
            
        }else{
            NSLog(@"人脸识别失败");
            
        }
        
    }];

    
}
-(void)buttonClick{
    if (_imageView) {
        //删除掉已经加载的view
        for (UIView*view in _imageView.subviews) {
            [view removeFromSuperview];
            
        }
    }
    //切换图片
    _imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",arc4random()%109]];
    
    [self recognitionFace];
}

@end
