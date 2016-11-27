# The apartment building is very tall, and the basement is very deep; he will never find the top or bottom floors.
require '2015_1_not_quite_lisp.rb'

describe "floor_finder" do
  it "starts Santa on the ground floor (floor 0)" do
    expect(floor_finder).to eq 0
  end

  it "moves up one floor for '('" do
    expect(floor_finder('(')).to eq 1
  end

  it "moves down one floor for ')'" do
    expect(floor_finder(')')).to eq -1
  end

  it "can parse a set of directions" do
    expect(floor_finder('(())')).to eq 0
    expect(floor_finder('()()')).to eq 0

    expect(floor_finder('(((')).to eq 3
    expect(floor_finder('(()(()(')).to eq 3
    expect(floor_finder('))(((((')).to eq 3

    expect(floor_finder('())')).to eq -1
    expect(floor_finder('))(')).to eq -1

    expect(floor_finder(')))')).to eq -3
    expect(floor_finder(')())())')).to eq -3
  end
end

describe "first_basement_char" do
  it "finds the position of the first character that causes him to enter the basement (floor -1)" do
    expect(first_basement_char(')')).to eq 1
  end

  it "can parse set of characters" do
    expect(first_basement_char('()())')).to eq 5
  end
end
