def binary_search(coll, target)
    high = coll.length - 1
    low = 0

    while low < high do
      mid = (low + high) / 2

      if coll[mid] == target
        return mid
      elsif coll[mid] < target
        low = mid + 1
      elsif coll[mid] > target
        high = mid - 1
      end
    end
  end

  # tests
  test_coll = [1, 2, 4, 8, 10, 20, 33, 51, 77, 83, 99, 100]
  num_to_find = 99  # index is 10
  puts binary_search(test_coll, num_to_find) == 10

  num_to_find = 3  # not in the collection
  puts binary_search(test_coll, num_to_find) == nil
