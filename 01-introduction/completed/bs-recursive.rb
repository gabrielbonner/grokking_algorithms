def binary_search(coll, target, high, low)
    mid = (low + high) / 2

    return mid if coll[mid] == target
    return if low >= high

    if coll[mid] < target
      binary_search(coll, target, high, low + 1)
    elsif coll[mid] > target
      binary_search(coll, target, high - 1, low)
    end
  end

  # tests
  test_coll = [1, 2, 4, 8, 10, 20, 33, 51, 77, 83, 99, 100]
  num_to_find = 99  # index is 10
  puts binary_search(test_coll, num_to_find, test_coll.length - 1, 0) == 10

  num_to_find = 3  # not in the collection
  puts binary_search(test_coll, num_to_find, test_coll.length - 1, 0) == nil
