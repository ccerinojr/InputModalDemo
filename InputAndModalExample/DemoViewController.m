//
//  DemoViewController.m
//  InputAndModalExample
//
//  Created by Ryan Tempas on 2/27/13.
//  Copyright (c) 2013 Ryan Tempas. All rights reserved.
//

#import "DemoViewController.h"
#import "DemoModalViewViewController.h"

@interface DemoViewController ()  <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, ItemEditDelegate>
{
    NSMutableArray *_items;
}

- (IBAction)addText:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *theTableView;
@property (weak, nonatomic) IBOutlet UITextField *aTextField;

@end

@implementation DemoViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _items = [[NSMutableArray alloc] initWithObjects:@"Add Items to the Table", @"This app is s1ck", nil];
}


-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];    
    [self.theTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"EditItem"])
	{
        DemoModalViewViewController* editViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.theTableView indexPathForSelectedRow];
        editViewController.text =  [_items objectAtIndex:indexPath.row];
        editViewController.editDelgate = self;
    }  
}

-(void)savedEdit:(NSString *)text {
    NSIndexPath *indexPath = [self.theTableView indexPathForSelectedRow];
    [_items replaceObjectAtIndex:indexPath.row withObject:text];
    
    [self.theTableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    
    return YES;
}

- (IBAction)addText:(id)sender
{
    [_items addObject:self.aTextField.text];
    [self.theTableView reloadData];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
   
   cell.textLabel.text =  [_items objectAtIndex: indexPath.row];
   
   return cell;
}


#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (editingStyle == UITableViewCellEditingStyleDelete)
   {
      [_items removeObjectAtIndex:indexPath.row];
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
   }
}

@end


