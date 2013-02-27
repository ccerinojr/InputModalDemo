//
//  DemoModalViewViewController.m
//  InputAndModalExample
//
//  Created by Ryan Tempas on 2/27/13.
//  Copyright (c) 2013 Ryan Tempas. All rights reserved.
//

#import "DemoModalViewViewController.h"

@interface DemoModalViewViewController ()  <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)saveEdit:(id)sender;
- (IBAction)cancelEdit:(id)sender;

@end

@implementation DemoModalViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _textField.text = _text;
}

#pragma mark Actions

- (IBAction)saveEdit:(id)sender
{
    [self.editDelgate savedEdit:_textField.text];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)cancelEdit:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}

@end
