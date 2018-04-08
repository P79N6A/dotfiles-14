//
//  sss.h
//  sss
//
//  Created by Sudprawat Atae on 9/4/18.
//  Copyright © 2018 Sudprawat Atae. All rights reserved.
//

#import <Automator/AMBundleAction.h>

@interface sss : AMBundleAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
