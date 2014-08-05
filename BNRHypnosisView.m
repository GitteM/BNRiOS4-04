//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Brigitte Michau on 2014/08/04.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // All BNRHypnosisView start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGRect bounds = self.bounds;
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The largest circle will circumscribe the view
    // The hypot() - euclidean distance function
    // computes the sqrt(x * x + y * y) without undue overflow or underflow.
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    //    float x = bounds.size.width;
    //    float y = bounds.size.height;
    //    float sqrt = sqrtf(x * x + y * y) / 2.0;
    //
    //    NSLog(@"sqrt() %f", sqrt);
    //    NSLog(@"hypot() %f", maxRadius);
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        // Draw inidividual circles - circles that are not connected.
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // Configure line width to 10 points
    path.lineWidth = 10;
    
    // Configure the drawing color to light gray
    [[UIColor lightGrayColor]setStroke];
    
    // Draw the line
    [path stroke];
    
    UIImage *logo = [UIImage imageNamed:@"logo.png"];

    float r = 2.0;
    CGSize logoSize;
    logoSize.width = logo.size.width / r;
    logoSize.height = logo.size.height / r;
    
    CGPoint logoPoint;
    logoPoint.x = ((bounds.origin.x + bounds.size.width) - logoSize.width) / 2.0;
    logoPoint.y = ((bounds.origin.y + bounds.size.height) - logoSize.height) / 2.0;
    
    CGRect logoRect = CGRectMake(logoPoint.x, logoPoint.y, logoSize.width, logoSize.height);
    
    [logo drawInRect:logoRect];
    
}

@end
