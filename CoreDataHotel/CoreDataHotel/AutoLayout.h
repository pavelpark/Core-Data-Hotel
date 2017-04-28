//
//  AutoLayout.h
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/24/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

@import UIKit;

@interface AutoLayout : NSObject

+(NSLayoutConstraint *)genericConstraintFrom:(UIView *)view
                                      toView:(UIView *)superView
                               withAttribute:(NSLayoutAttribute)attribute
                               andMultiplier:(CGFloat)multiplier;

+(NSLayoutConstraint *)genericConstraintFrom:(UIView *)view
                                      toView:(UIView *)superView
                               withAttribute:(NSLayoutAttribute)attribute;

+(NSArray *)fullScreenConstraintsWithVFLForView:(UIView *)view;

+(NSLayoutConstraint *)equalHeightConstraintFromView:(UIView *)view
                                              toView:(UIView *)otherView
                                      withMultiplier:(CGFloat)multiplier;

+(NSLayoutConstraint *)leadingConstraintFrom: (UIView *)view
                                      toView:(UIView *)otherView;

+(NSLayoutConstraint *)trailingConstraintFrom:(UIView *)view
                                       toView:(UIView *)otherView;

+(NSLayoutConstraint *)topConstraintFrom:(UIView *)view
                                  toView:(UIView *)otherView;

+(NSLayoutConstraint *)bottomConstraintFrom:(UIView *)view
                                     toView:(UIView *)otherView;

+(NSArray *)constraintsWithVFLForViewDictionary:(NSDictionary *)viewDictionary
                           forMetricsDictionary:(NSDictionary *)metricsDictionary
                                    withOptions:(NSLayoutFormatOptions)options
                               withVisualFormat:(NSString *)visualFormat;


+(NSLayoutConstraint *)offset:(CGFloat)offset
                   forItemTop:(id)item
                 toItemBottom:(id)otherItem;


+(NSLayoutConstraint *)offset:(CGFloat)offset
                forItemBottom:(id)item
                    toItemTop:(id)otherItem;

+(NSLayoutConstraint *)offset:(CGFloat)offset
                forItemBottom:(id)item
                 toItemBottom:(id)otherItem;

+(NSLayoutConstraint *)height:(CGFloat)height forView:(UIView *)view;
+(NSLayoutConstraint *)width:(CGFloat)width forView:(UIView *)view;

+(NSLayoutConstraint *)centerXforView:(UIView *)view toView:(UIView *)otherView;
+(NSLayoutConstraint *)centerYforView:(UIView *)view toView:(UIView *)otherView;


@end
