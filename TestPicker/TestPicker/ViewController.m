//
//  ViewController.m
//  TestPicker
//
//  Created by Antonio Montes on 11/8/17.
//  Copyright © 2017 Antonio Montes. All rights reserved.
//

#import "ViewController.h"
#import "DocumentBrowserViewController.h"
//#import <MobileCoreServices/UTCoreTypes.h>

@interface ViewController()

@property UIBarButtonItem* doneBtnItem;

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];

    // create a cancel button
    _doneBtnItem = [[UIBarButtonItem alloc] initWithTitle: @"Cancel"
                                                    style: UIBarButtonItemStyleDone
                                                   target: self
                                                   action: @selector(cancelTapped:)];
}

- (void) cancelTapped: (UIButton*) sender {

    UINavigationController* nc = (UINavigationController*)[self presentedViewController];
    if (nc)
        [nc dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction) BackupOrExport: (id) sender {
    
    [self doIt:@"BackupOrExport" createDoc:YES];
}

- (IBAction) RestoreOrImport: (id) sender {

    [self doIt:@"RestoreOrImport" createDoc:NO];
}

- (void) doIt: (NSString*) title createDoc: (BOOL) create {
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DocumentBrowserViewController* dbvc = [sb instantiateViewControllerWithIdentifier:@"DocumentBrowserViewController"];
    dbvc.allowsDocumentCreation = create;
    dbvc.navigationItem.leftBarButtonItem = _doneBtnItem;
    dbvc.title = title;

    UIViewController* dummyVC = [UIViewController new];
    id nc = [[UINavigationController alloc] initWithRootViewController:dummyVC];
    [self presentViewController:nc animated:NO completion:nil];
    [dummyVC.navigationController pushViewController:dbvc animated:NO];
}

@end
