class Array

  def my_flatten
    array = []
    self.each do |el|
      unless el.is_a?(Array)
        array << el
      else
        array += el.my_flatten
      end
    end
    array
  end

  def my_zip(*args)
    array = Array.new(self.length) { Array.new(args.length + 1) }
    (0...self.length).each do |i|
      (0..args.length).each do |j|
        if i == 0
          array[j][i] = self[j]
        else
          array[j][i] = args[i - 1][j]
        end
      end
    end
    array
  end
  
end

