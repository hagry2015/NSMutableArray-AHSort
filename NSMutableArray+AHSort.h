//
//  NSMutableArray+AHSort.h
//  Algorithms
//
//  Created by Amr El-Hagry on 2/4/16.
//  Copyright © 2016 Xcode Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (AHSort)

-(NSMutableArray*)bubbleSort;
-(NSMutableArray*)quickSortWithLeftIndex:(int)left andRightIndex:(int)right;
-(NSMutableArray*)selectionSort;
-(NSMutableArray*)insertionSort;
-(NSMutableArray*)shellSort;

@end
