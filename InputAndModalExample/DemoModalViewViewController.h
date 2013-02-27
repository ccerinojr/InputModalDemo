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

- (IBAction)saveEdit:(id)sender;
- (IBAction)cancelEdit:(id)sender;

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) NSObject<ItemEditDelegate>* editDelgate;




@end
