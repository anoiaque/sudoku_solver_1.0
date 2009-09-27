class Membre
  
  @value
  
  
  
  def can_contain? number
    self.each_element{ |e| return false if (e.value == number )}
  end
  
  def each_element
    @value.each {|elem| yield elem}
  end
 
  def to_a
    @value.map {|elem| a = a +[elem.value]}
  end
  
end
