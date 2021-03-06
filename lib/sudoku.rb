require 'sudoku_extensions.rb'

class Sudoku 

  attr_accessor :elements,:blocks,:lines,:columns
  
  def solve 
    change = false
     
     self.each_element do |e|
       (1..9).each do |number|
        if number.can_only_be_in? e
          change = true
          e.set_with number
        end
      end
    end
    
    solve if !self.complete? && change
  end
  
  
  def complete?
   (1..81).each {|c| return false if element(c).empty?}
  end
  
  def == sudoku
   (1..81).each {|k| return false if self.element(k).value != sudoku.element(k).value}
  end
  
  
  
  # Constructeur & accesseurs
  def initialize sudoku_array=nil
    unless sudoku_array.nil?
      sudoku = sudoku_array.to_sudoku
      @elements = sudoku.elements
      @blocks = sudoku.blocks
      @lines = sudoku.lines
      @columns = sudoku.columns
    end
  end
  
  def each_line
   (1..9).each {|k| yield line(k)}
  end
  
  def each_column
   (1..9).each {|k| yield column(k)}
  end
  
  def each_block
   (1..9).each {|k| yield block(k)}
  end
  
  def each_element
   (1..81).each {|k| yield element(k)}
  end
  
  def element num
    @elements[num - 1]
  end
  
  def line num
    @lines[num - 1]
  end
  
  def column num
    @columns[num - 1]
  end
  
  def block num
    @blocks[num - 1]
  end
  
end