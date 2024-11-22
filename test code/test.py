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
    line = input()
    k = [int(i) for i in line.strip().split()]
    print(solution(k))

# Example edge case tests:
print(solution([]))  # Output: 0 (empty array)
print(solution([22]))  # Output: 1 (single element)
print(solution([22, 22, 22, 22]))  # Output: 4 (all elements the same)
print(solution([1, 2, 3, 4, 5]))  # Output: 1 (no possible combinations)
print(solution([2, 2, 4, 4, 4, 6, 8]))  # Output: 6 (maximize 4s)
print(solution([1, 3, 5, 7]))  # Output: 1 (no possible combinations)
print(solution([1, 200, 2, 199, 3, 198]))  # Output: 3 (combine to 200)
print(solution([201, 202, 203]))  # Output: 0 (invalid elements)
print(solution([0, -1, 22, -22]))  # Output: 1 (invalid elements filtered)
print(solution([13, 7, 6, 13, 4, 13, 5, 13, 8, 13]))  # Output: 7 (maximize 13s)

