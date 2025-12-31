//
//  QuickSort.swift
//  DSA-Practice
//
//  Created by Paridhi Malviya on 12/17/25.
//

class QuickSort {
    
    init() {
        var array = [8, 5, 1, 3, 7, 2, 9, 6]
        quickSort(array: &array, low: 0, high: 7)
    }
}

extension QuickSort {
    
    //Based on a condition, if we need to partition an array in 2 subsets then this can be used.
    /*
     popular questions related to this:
      1. odd even numbers separation
     2. separate elements <=  pivot and elements > pivot
     3. separate 0s and non 0s
     4. separate 0s and 1s
     */
    
    func quickSort(array: inout [Int], low: Int, high: Int) {
        
        if (low >= high) {
            return
        }
        //first get the pivot point
        let pivot: Int = array[high]
        let pivotIndex = partition(input: &array, pivot: pivot, low: low, high: high)
        quickSort(array: &array, low: low, high: pivotIndex - 1)
        quickSort(array: &array, low: pivotIndex + 1, high: high)
        
        print("sorted array \(array)")
    }
    
    func partition(input: inout [Int], pivot: Int, low: Int, high: Int) -> Int {
        /*
         3 subgroups -
         i to end - unknown, unvisited
         0 to j- 1 -> less than or equal to pivot
         j - (i-1) -> greater than pivot
         */
        var i = low
        var j = low
        while (i <= high) {
            if (input[i] <= pivot) {
               swap(array: &input, i: i, j: j)
               i += 1
               j += 1
           } else {
                i += 1
            }
        }
        return (j - 1) //pivot index
    }

    func partitionAnArrayWithPivot() {
        //Partiiotn an array with a pivot element so that the less than or equal to elements are towards the left side and greater elements are at the right side of the pivot element.
        var inputArray = [7, 9, 4, 8, 3, 6, 2, 1]
        let pivot = 5
        
        /*
         3 regions
         i to end -> unknown elements
         0 to (j - 1) -> elements <= pivot
         (j) to (i - 1) -> elements > pivot
         */
        var i = 0
        var j = 0
        while (i < inputArray.count) {
            if (inputArray[i] > pivot) {
                i += 1
            } else if (inputArray[i] <= pivot) {
                swap(array: &inputArray, i: i, j: j)
                i += 1
                j += 1
            }
        }
        print("updated array \(inputArray)")
        let _  = partition(input: &inputArray, pivot: 6, low: 0, high: 7)
    }
    
    func swap(array: inout [Int], i: Int, j: Int) {
        let temp = array[i]
        array[i] = array[j]
        array[j] = temp
    }
    
}
