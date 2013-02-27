//
//  DemoModalViewViewController.h
//  InputAndModalExample
//
//  Created by Ryan Tempas on 2/27/13.
//  Copyright (c) 2013 Ryan Tempas. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ItemEditDelegate <NSObject>
- (void)savedEdit:(NSString *)text;
@end

@interface DemoModalViewViewController : UIViewController

@property (strong, nonatomic) NSString *text;
@property (weak, nonatomic) NSObject<ItemEditDelegate>* editDelgate;

@end
