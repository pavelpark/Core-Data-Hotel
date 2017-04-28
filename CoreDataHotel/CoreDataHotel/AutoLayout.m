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
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeLeading
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherView
                                                                  attribute:NSLayoutAttributeLeading
                                                                 multiplier:1.0
                                                                   constant:0.0];
    
    constraint.active = YES;
    
    return constraint;
}

+(NSLayoutConstraint *)trailingConstraintFrom:(UIView *)view
                                       toView:(UIView *)otherView{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeTrailing
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherView
                                                                  attribute:NSLayoutAttributeTrailing
                                                                 multiplier:1.0
                                                                   constant:0.0];
    
    constraint.active = YES;
    
    return constraint;
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
//created a method
+(NSLayoutConstraint *)topConstraintFrom:(UIView *)view
                                  toView:(UIView *)otherView{
    return [AutoLayout genericConstraintFrom:view
                                      toView:otherView
                               withAttribute:NSLayoutAttributeTop];
}
+(NSLayoutConstraint *)bottomConstraintFrom:(UIView *)view
                                     toView:(UIView *)otherView{
    return [AutoLayout genericConstraintFrom:view
                                      toView:otherView
                               withAttribute:NSLayoutAttributeBottom];
}


+(NSLayoutConstraint *)offset:(CGFloat)offset
                   forItemTop:(id)item
                 toItemBottom:(id)otherItem{
    
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:item
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherItem
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:offset];
    
    constraint.active = YES;
    return constraint;
}

+(NSLayoutConstraint *)offset:(CGFloat)offset
                forItemBottom:(id)item
                    toItemTop:(id)otherItem {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:item
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherItem
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1.0
                                                                   constant:offset];
    
    constraint.active = YES;
    return constraint;
}

+(NSLayoutConstraint *)offset:(CGFloat)offset
                forItemBottom:(id)item
                 toItemBottom:(id)otherItem {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:item
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherItem
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:offset];
    
    constraint.active = YES;
    return constraint;
}


+(NSLayoutConstraint *)height:(CGFloat)height forView:(UIView *)view {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:height];
    
    constraint.active = YES;
    return constraint;
}

+(NSLayoutConstraint *)width:(CGFloat)width forView:(UIView *)view {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:width];
    
    constraint.active = YES;
    return constraint;
}


+(NSLayoutConstraint *)centerXforView:(UIView *)view toView:(UIView *)otherView{
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0
                                                                   constant:0.0];
    
    constraint.active = YES;
    return constraint;
}


+(NSLayoutConstraint *)centerYforView:(UIView *)view toView:(UIView *)otherView{
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherView
                                                                  attribute:NSLayoutAttributeCenterY
                                                                 multiplier:1.0
                                                                   constant:0.0];
    
    constraint.active = YES;
    return constraint;
}

@end
