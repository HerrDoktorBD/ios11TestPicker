//
//  Document.h
//  TestPicker
//
//  Created by Antonio Montes on 10/26/17.
//  Copyright © 2017 Antonio Montes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Document : UIDocument

+ (void) createDocumentWithCompletionBlock: (void(^)(Document*)) completionBlock;

@end
