//
//  AutoLayout.m
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/24/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

#import "AutoLayout.h"

@implementation AutoLayout

+(NSArray *)fullScreenConstraintsWithVFLForView:(UIView *)view{
    
    NSMutableArray *constraints = [[NSMutableArray alloc]init];
    
    NSDictionary *viewDictionary = @{@"view": view};
    
//    CGFloat padding = 10.0;
//    CGFloat paddingMultiplier = 5.0;
    
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|"
                                                                             options: 0
                                                                             metrics: nil
                                                                               views:viewDictionary];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|"
                                                                             options: 0
                                                                             metrics: nil
                                                                               views:viewDictionary];

    [constraints addObjectsFromArray:horizontalConstraints];
    [constraints addObjectsFromArray:verticalConstraints];
    
    [NSLayoutConstraint activateConstraints:constraints];
    
    return constraints.copy;
}

+(NSLayoutConstraint *)genericConstraintFrom:(UIView *)view
                                      toView:(UIView *)superView
                               withAttribute:(NSLayoutAttribute)attribute
                               andMultiplier:(CGFloat)multiplier{
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:attribute
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:superView
                                                                  attribute:attribute
                                                                 multiplier:multiplier
                                                                   constant:0.0];
    
    constraint.active = YES;
    
    return constraint;
}

+(NSLayoutConstraint *)genericConstraintFrom:(UIView *)view
                                      toView:(UIView *)superView
                               withAttribute:(NSLayoutAttribute)attribute{
    
    return [AutoLayout genericConstraintFrom:view
                                      toView:view
                               withAttribute:attribute
                               andMultiplier:1.0];
}

+(NSLayoutConstraint *)equalHeightConstraintFromView:(UIView *)view
                                              toView:(UIView *)otherView
                                      withMultiplier:(CGFloat)multiplier{
    
    NSLayoutConstraint *heightConstraint = [AutoLayout genericConstraintFrom:view
                                                                      toView:otherView
                                                               withAttribute:NSLayoutAttributeHeight
                                                               andMultiplier:multiplier];
    
    return heightConstraint;
}

+(NSLayoutConstraint *)leadingConstraintFrom: (UIView *)view
                                      toView:(UIView *)otherView{
    return [AutoLayout genericConstraintFrom:view
                                      toView:otherView
                               withAttribute:NSLayoutAttributeLeading];
}

+(NSLayoutConstraint *)trailingConstraintFrom:(UIView *)view
                                       toView:(UIView *)otherView{
    return [AutoLayout genericConstraintFrom:view
                                      toView:otherView
                               withAttribute:NSLayoutAttributeTrailing];
}
+(NSArray *)constraintsWithVFLForViewDictionary:(NSDictionary *)viewDictionary
                           forMetricsDictionary:(NSDictionary *)metricsDictionary
                                    withOptions:(NSLayoutFormatOptions)options
                               withVisualFormat:(NSString *)visualFormat{
    NSArray *constraints = [[NSArray alloc]init];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                          options:options
                                                          metrics:metricsDictionary
                                                            views:viewDictionary];
    [NSLayoutConstraint activateConstraints:constraints];
    return constraints.copy;
}


@end
