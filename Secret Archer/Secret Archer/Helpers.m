//
//  Helpers.m
//  Secret Archer
//
//  Created by Ariel Rodriguez on 9/7/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Helpers.h"

NSString * fwk_pathWithFilename(NSString *filename) {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *path = [documentsDirectory stringByAppendingPathComponent:filename];
    
    return path;
    
}

void fwk_removeFileWithName(NSString *filename) {
    
    NSString *path = fwk_pathWithFilename(filename);
    
    NSError *error = nil;
    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:path
                                                              error:&error];
    
    if ( !success ) {
        
        NSLog(@"%@", error);
        
    }
    
}

BOOL fwk_fileWithFileNameExist(NSString *filename) {
    
    NSString *path = fwk_pathWithFilename(filename);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL fileWithFileNameExist = [fileManager fileExistsAtPath:path];
    
    return fileWithFileNameExist;
    
}