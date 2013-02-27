//
//  DemoViewController.h
//  InputAndModalExample
//
//  Created by Ryan Tempas on 2/27/13.
//  Copyright (c) 2013 Ryan Tempas. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DemoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
}
- (IBAction)addText:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *theTableView;
@property (strong, nonatomic) IBOutlet UITextField *aTextField;



@end
