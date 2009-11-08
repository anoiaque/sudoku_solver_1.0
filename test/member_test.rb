require "test/unit"
require "sudoku.rb"

class MemberTester < Test::Unit::TestCase

  def setup
    @sudoku = Sudoku.new(
       [0,0,8,1,0,0,3,0,5,
        6,2,0,0,3,9,0,4,7,
        4,1,7,2,5,0,0,0,0,
        0,0,0,0,0,0,6,0,4,
        0,0,0,0,1,3,0,9,0,
        0,0,0,0,0,0,7,0,2,
        0,5,3,4,9,0,0,0,0,
        0,7,0,0,2,6,0,8,0,
        0,0,6,5,0,0,4,0,1])
  end

  def test_pairs_generator
    pairs_with_block(6,[35,53],[1,3])
    pairs_with_block(2,[5,6],[4,7])
  end




  private
  def pairs_with_block(idx_block,idx_elems,values)

    assert @sudoku.block(idx_block).pairs
    assert_equal values,@sudoku.element(idx_elems[0]).pair
    assert_equal values,@sudoku.element(idx_elems[1]).pair
    assert_equal @sudoku.element(idx_elems[0]), @sudoku.element(idx_elems[1]).pair_link
    assert_equal @sudoku.element(idx_elems[1]), @sudoku.element(idx_elems[0]).pair_link

  end


  
end