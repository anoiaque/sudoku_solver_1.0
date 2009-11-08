require "sudoku.rb"
require "member.rb"  

class Element < Membre

  
  attr_accessor :value , :block_idx  , :line_idx,:column_idx,:index,:sudoku,:pair,:pair_link
  
  def can_only_contain? number
    [block,line,column].each {|member| return true if member.can_only_contain?(number,self)}
    false
  end
  
  def can_contain? number
   
    self.empty? && 
      number.can_be_in?(line)&&
      number.can_be_in?(column) &&
      number.can_be_in?(block)
  end
  
  def empty?
    self.value == 0 
  end
  
  def set_with number
    self.value = number
  end
  
  def block 
    @sudoku.block(@block_idx)
  end
  
  def line 
    @sudoku.line(@line_idx)
  end
  
  def column 
    @sudoku.column(@column_idx)
  end
  
  def initialize value,index,line_idx,col_idx,block_idx
    @index = index
    @value = value
    @line_idx = line_idx
    @column_idx = col_idx
    @block_idx = block_idx
    @pair = []
    @pair_link = nil
   
  end
  
  
  
end