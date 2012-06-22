//
//  UIImage+Storage.h
//  UIImage+Storage
//
//  Created by Andrew Sliwinski on 6/21/12.
//  Copyright (c) 2012 DIY, Co. All rights reserved.
//

@interface UIImage (Storage)

- (NSURL *)saveToTemporary;
- (NSURL *)saveToCache;

@end