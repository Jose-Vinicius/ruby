require "./lib/recursive/mergesort"

describe "#merge_sort" do
  it "return empty array" do
    arr_expect = []
    expect(merge_sort([])).to eql(arr_expect)
  end

  it "return one element array" do
    arr_expect = [73]
    expect(merge_sort([73])).to eql(arr_expect)
  end
  it "return pre-ordened array" do
    arr_expect = [1, 2, 3, 4, 5]
    expect(merge_sort([1, 2, 3, 4, 5])).to eql(arr_expect)
  end

  it "return ordened array" do
    arr_expect = [0, 1, 1, 2, 3, 5, 8, 13]
    expect(merge_sort([3, 2, 1, 13, 8, 5, 0, 1])).to eql(arr_expect)
  end

  it "return other ordened array" do
    arr_expect = [79, 100, 105, 110]
    expect(merge_sort([105, 79, 100, 110])).to eql(arr_expect)
  end
end
