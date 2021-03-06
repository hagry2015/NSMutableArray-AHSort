//
//  NSMutableArray+AHSort.m
//  Algorithms
//
//  Created by Amr El-Hagry on 2/4/16.
//  Copyright © 2016 Xcode Developer. All rights reserved.
//

#import "NSMutableArray+AHSort.h"

@implementation NSMutableArray (AHSort)
-(NSMutableArray*)bubbleSort
{
    BOOL swapped=false;
    do
    {
        swapped=false;
        for (int i=0; i<[self count]-1; i++) {
            if ([[ self objectAtIndex:i] intValue]>[[ self objectAtIndex:i+1] intValue])
            {
                NSObject *firstObject=[self objectAtIndex:i];
                [self replaceObjectAtIndex:i withObject:[self objectAtIndex:i+1]];
                [self replaceObjectAtIndex:i+1 withObject:firstObject];
                swapped=true;
            }
        }
    }
    
    while (swapped==true);
    
    return self;
}
-(NSMutableArray*)selectionSort
{
    id min=nil;
    id temp=nil;
    int index=0;
    for (int i=0; i<[self count]-1; i++) {
        
        min=[self objectAtIndex:i];
        
        for (int j=i+1; j<[self count]; j++) {
            if ([[self objectAtIndex:j] intValue] < [min intValue]) {
                min=[self objectAtIndex:j];
                index=j;
            }
        }
        
        temp=[self objectAtIndex:i];
        [self replaceObjectAtIndex:i withObject:min];
        [self replaceObjectAtIndex:index withObject:temp];
        
    }
    return self;
}

-(NSMutableArray*)insertionSort
{
    int j=0;
    id temp=nil;
    for (int i=1; i<[self count]; i++) {
        j=i;
        
        while (j!=0 && [[self objectAtIndex:j-1] intValue]>[[self objectAtIndex:j] intValue]) {
            temp=[self objectAtIndex:j];
            [self replaceObjectAtIndex:j withObject:[self objectAtIndex:j-1]];
            [self replaceObjectAtIndex:j-1 withObject:temp];
            j--;
        }
    }
    return self;
}
-(NSMutableArray*)shellSort
{
    id temp=nil;
    int i,j;
    
    for (int gap=0 ;gap<[self count];gap++)
    {
        for ( i = gap; i < [self count]; i++)
        {
            temp = self[i];
            for ( j = i; j >= gap && [self[j - gap] intValue ]> [temp intValue]; j -= gap)
            {
                self[j] = self[j - gap];
            }
            self[j] = temp;
        }
    }
    return self;
}
-(NSMutableArray*)quickSortWithLeftIndex:(int)left andRightIndex:(int)right
{
    int i = left, j = right;
    NSObject *tmp;
    id pivot = self[(left + right) / 2];
    
    /* partition */
    do {
        while ([[self objectAtIndex:i] intValue]< [pivot intValue] )
            i++;
        while ([[self objectAtIndex:j] intValue]> [pivot intValue])
            j--;
        if (i <= j) {
            
            tmp = [self objectAtIndex:i];
            [self replaceObjectAtIndex:i withObject:[self objectAtIndex:j]];
            [self replaceObjectAtIndex:j withObject:tmp];
            i++;
            j--;
            
        }
        
    } while (i <= j);
    
    /* recursion */
    if (left < j)
    {
        [self quickSortWithLeftIndex:left andRightIndex:j];
    }
    if (i < right)
    {
        [self quickSortWithLeftIndex:i andRightIndex:right];
    }
    
    return self;
}

@end
