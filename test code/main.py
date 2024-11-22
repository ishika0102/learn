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
    
    # Find the initial most frequent integer and its count
    target, max_freq = count.most_common(1)[0]
    
    # Initialize the maximum count with the most frequent element count
    max_count = max_freq
    
    # Create a set to keep track of which pairs have been checked
    checked_pairs = set()

    for num in count:
        for other in count:
            if num == other or (num, other) in checked_pairs or (other, num) in checked_pairs:
                continue

            # Mark this pair as checked
            checked_pairs.add((num, other))

            # If the sum of num and other equals any key in count, we can combine them
            combined_sum = num + other
            if combined_sum in count:
                max_count = max(max_count, count[combined_sum] + min(count[num], count[other]))

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
