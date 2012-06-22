//
//  UIImage+Storage.h
//  UIImage+Storage
//
//  Created by Andrew Sliwinski on 6/21/12.
//  Copyright (c) 2012 DIY, Co. All rights reserved.
//

#import "UIImage+Storage.h"

@implementation UIImage (Storage)

#pragma mark - Public methods

/**
 * Returns an NSURL for the saved asset.
 *
 * @return  NSURL
 */
- (NSURL *)saveToTemporary
{
    NSData *imageData       = UIImageJPEGRepresentation(self, 0.9);
    NSString *assetPath     = [self createAssetFilePath:0 withExtension:@"jpg"];
    [imageData writeToFile:assetPath atomically:true];
    
    return [NSURL URLWithString:assetPath];
}

/**
 * Returns an NSURL for the saved asset.
 *
 * @return  NSURL
 */
- (NSURL *)saveToCache
{
    NSData *imageData       = UIImageJPEGRepresentation(self, 0.9);
    NSString *assetPath     = [self createAssetFilePath:1 withExtension:@"jpg"];
    [imageData writeToFile:assetPath atomically:true];
    
    return [NSURL URLWithString:assetPath];
}

#pragma mark - Private methods

/**
 * Creates an asset file path using type declaration and file extension.
 *
 * @param  int  Type (0 - NSTemporaryDirectory() | 1 - NSCachesDirectory)
 * @param  NSString  Extension (e.g. @"jpg")
 *
 * @return  NSString
 */
- (NSString *)createAssetFilePath:(int)type withExtension:(NSString *)extension
{
    NSArray *paths                  = nil;
    NSString *documentsDirectory    = nil;
    
    switch (type) {
        case 0:
            documentsDirectory      = NSTemporaryDirectory();
            break;
        default:
            paths                   = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            documentsDirectory      = [paths objectAtIndex:0];
            break;
    }
    
    NSString *assetName             = [NSString stringWithFormat:@"%@.%@", [[NSProcessInfo processInfo] globallyUniqueString], extension];
    NSString *assetPath             = [documentsDirectory stringByAppendingPathComponent:assetName];
    
    return assetPath;
}

@end
