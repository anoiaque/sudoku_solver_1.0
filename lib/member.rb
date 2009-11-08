class Membre

  
 
  def can_contain? number
    self.each_element{ |e| return false if (e.value == number )}
  end

  def can_only_contain? number,in_element
    can_contain?(number) &&
      each_element { |e|  break false if (e.can_contain?(number) && (e.index != in_element.index))}
  end
  
  def each_element
    @value.each {|elem| yield elem}
  end

  def pairs
    doublons = (1..9).map { |n| n.can_only_be_in_two_elements?(self)}
    pairs =  doublons.map {|dbl| (!dbl.nil? && doublons.count(dbl) == 2) ?  dbl : nil}
   
    pairs.each_with_index do |pair,i|
      next if pair.nil?
      pair.first.pair.push(i+1)
      pair.first.pair_link = pair.last
      pair.last.pair.push(i+1)
      pair.last.pair_link = pair.first
    end
  end

  def only_two_elements_can_contain? number
    p=[]
    self.each_element{|e| p+=[e] if number.can_be_in?(e)}
    p.length == 2 ? p : nil
  end
 
  def to_a
    @value.map {|elem| a = a +[elem.value]}
  end
  
end
