require '2015_20_infinite_elves.rb'

# street with infinite houses numbered sequentially: 1, 2, 3, 4, 5, and so on.

# The first Elf (number 1) delivers presents to every house: 1, 2, 3, 4, 5, ....
# The second Elf (number 2) delivers presents to every second house: 2, 4, 6, 8, 10, ....
# Elf number 3 delivers presents to every third house: 3, 6, 9, 12, 15, ....
# There are infinitely many Elves, numbered starting with 1. Each Elf delivers presents equal to ten times his or her number at each house.
#
# The first house gets 10 presents: it is visited only by Elf 1, which delivers 1 * 10 = 10 presents. The fourth house gets 70 presents, because it is visited by Elves 1, 2, and 4, for a total of 10 + 20 + 40 = 70 presents.

# What is the lowest house number of the house to get at least as many presents as the number in your puzzle input?

describe 'present_counter' do
  it "can count presents delivered to houses" do
    expect(present_counter(1)).to eq 10
    expect(present_counter(2)).to eq 30
    expect(present_counter(3)).to eq 40
    expect(present_counter(4)).to eq 70
    expect(present_counter(5)).to eq 60
    expect(present_counter(6)).to eq 120
    expect(present_counter(7)).to eq 80
    expect(present_counter(8)).to eq 150
    expect(present_counter(9)).to eq 130
  end
end
