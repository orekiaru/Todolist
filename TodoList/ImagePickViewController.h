//
//  ImagePickViewController.h
//  TodoList
//
//  Created by aru oreki on 2020/3/1.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImagePickViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic,strong)UIImagePickerController *imagePickerController;
@end

NS_ASSUME_NONNULL_END
