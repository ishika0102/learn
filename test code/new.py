from typing import List
from collections import Counter

def solution(wood: List[int]) -> int:
    if not wood:
        return 0

    # Filter elements to be within the valid range (2 to 200)
    wood = [x for x in wood if 2 <= x <= 200]
    if not wood:
        return 0

    # Count the occurrences of each integer
    count = Counter(wood)
    
    # Identify the most frequent integer
    target, max_freq = count.most_common(1)[0]
    
    # Initial maximum count
    max_count = max_freq
    
    # Try to combine pairs to form the target
    # Create a set of numbers to avoid checking pairs more than once
    checked_pairs = set()

    # Iterate through each unique number
    for num in count:
        if num == target:
            continue

        for other in count:
            if other == num or other == target:
                continue

            # Create a frozenset of the pair (num, other)
            pair = frozenset({num, other})
            
            # If the pair has been checked, skip it
            if pair in checked_pairs:
                continue

            # If the sum of num and other equals the target, we can combine them
            if num + other == target:
                max_count += min(count[num], count[other])
            
            # Add both possible pair representations to the checked_pairs set
            checked_pairs.add(pair)

    return max_count

if __name__ == '__main__':
    # Example input reading and output
    line = input("Enter space-separated numbers: ")
    k = [int(i) for i in line.strip().split()]
    print("Output:", solution(k))

# Additional edge case tests:
def test_edge_cases():
    assert solution([]) == 0  # Output: 0 (empty array)
    assert solution([22]) == 1  # Output: 1 (single element)
    assert solution([22, 22, 22, 22]) == 4  # Output: 4 (all elements the same)
    assert solution([1, 2, 3, 4, 5]) == 1  # Output: 1 (no possible combinations)
    assert solution([2, 2, 4, 4, 4, 6, 8]) == 6  # Output: 6 (maximize 4s)
    assert solution([1, 3, 5, 7]) == 1  # Output: 1 (no possible combinations)
    assert solution([1, 200, 2, 199, 3, 198]) == 3  # Output: 3 (combine to 200)
    assert solution([201, 202, 203]) == 0  # Output: 0 (invalid elements)
    assert solution([0, -1, 22, -22]) == 1  # Output: 1 (invalid elements filtered)
    assert solution([13, 7, 6, 13, 4, 13, 5, 13, 8, 13]) == 7  # Output: 7 (maximize 13s)

    # Additional edge cases
    assert solution([2, 3, 4, 5, 6, 7, 8, 9]) == 0  # Output: 0 (no valid combinations)
    assert solution([200, 200, 199, 199, 2, 2, 2]) == 4  # Output: 4 (maximize 200s and 199s)print(solution([7,7,7,7,4,3,7,8,1,7])) 
    assert solution([100] * 1000000) == 1000000  # Output: 1000000 (all elements the same)
    assert solution([7,7,7,7,4,3,7,8,1,7])

    print("All test cases passed!")

# Run additional edge case tests
test_edge_cases()
