//
//  MainBase.h
//  iGuests
//
//  Created by admin on 24.01.13.
//  Copyright (c) 2013 tricton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MainBase : NSManagedObject

@property (nonatomic) NSTimeInterval day;
@property (nonatomic) float weight;
@property (nonatomic) float temperature;
@property (nonatomic) BOOL sex;
@property (nonatomic) BOOL tablets;
@property (nonatomic) BOOL filling;
@property (nonatomic, retain) NSString * note;
@property (nonatomic) BOOL sport;
@property (nonatomic) BOOL ovulation;
@property (nonatomic) BOOL period;
@property (nonatomic) BOOL paininlumbus;
@property (nonatomic) BOOL paininhead;
@property (nonatomic) BOOL paininalvus;
@property (nonatomic) BOOL paininbreast;
@property (nonatomic) BOOL vertigo;
@property (nonatomic) BOOL highpressure;
@property (nonatomic) BOOL lowpressure;
@property (nonatomic) BOOL appetite;
@property (nonatomic) BOOL constipation;
@property (nonatomic) BOOL diarrhea;
@property (nonatomic) BOOL pullsindesert;
@property (nonatomic) BOOL pullsinsalt;
@property (nonatomic) BOOL pullinsour;
@property (nonatomic) BOOL abdominaldistention;
@property (nonatomic) BOOL acne;
@property (nonatomic) BOOL increasebreast;
@property (nonatomic) BOOL sweling;

@end
