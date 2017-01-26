class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    array = []
    self.my_each do |el|
      array << el if prc.call(el)
    end
    array
  end

  def my_reject(&prc)
    rejections = self.my_select(&prc)
    self - rejections
  end

  def my_any?(&prc)
    result = false
    self.my_each do |el|
      result = true if prc.call(el)
    end
    result
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end
    true
  end
end

