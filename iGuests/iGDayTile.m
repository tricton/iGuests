//
//  iGDayTile.m
//  iGuests
//
//  Created by admin on 10.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import "iGDayTile.h"

@implementation iGDayTile

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    CGContextRef dayTiles = UIGraphicsGetCurrentContext();
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        for (int i = 4; i < 319; i += 45){
            for (int j = 50; j < 315; j +=45){
                CGRect dayTileRect = CGRectMake(i, j, 42, 42);
                CGContextSetRGBFillColor(dayTiles, 0.8, 0.2, 0.2, 1);
                CGContextSaveGState(dayTiles);
                CGContextRestoreGState(dayTiles);
                CGContextFillRect(dayTiles, dayTileRect);
                
                CGContextSetLineWidth(dayTiles, 2.0);
                CGContextSetRGBStrokeColor(dayTiles, 0.5, 0.5, 0.5, 1);
             
                CGContextMoveToPoint(dayTiles, i, j);
                CGContextAddLineToPoint(dayTiles, i + 42, j);
                CGContextMoveToPoint(dayTiles, i, j);
                CGContextAddLineToPoint(dayTiles, i, j + 42);
                CGContextMoveToPoint(dayTiles, i + 42, j);
                CGContextAddLineToPoint(dayTiles, i + 42, j + 42);
                CGContextMoveToPoint(dayTiles, i, j + 42);
                CGContextAddLineToPoint(dayTiles, i + 42, j + 42);
                
                CGContextSetLineJoin(dayTiles, kCGLineJoinRound);
                
                CGContextStrokePath(dayTiles);
            }
        }
    }
    
}


@end
