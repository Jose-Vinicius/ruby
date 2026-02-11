require "./lib/recursive/fibonacci"

describe "#fibs_loop" do
  context "when fibs range is valid number" do
    it "return array with fibonnaci sequence" do
      arr_expect = [0, 1, 1, 2, 3, 5, 8, 13]
      expect(fibs_loop(8)).to eql(arr_expect)
    end
  end
end

describe "#fibs_recursive" do
  context "when fibs range is valid number" do
    it "return array with fibonnaci sequence" do
      arr_expect = [0, 1, 1, 2, 3, 5, 8, 13]
      expect(fibs_recursive(8, [0, 1])).to eql(arr_expect)
    end
  end
end
