class Card
  attr_reader :value, :face_up

  def initialize(value)
    @value = value
    @face_up = false
  end

  def display
    @face_up ? @value : nil
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    display.nil? ? "-" : value.to_s
  end

  def ==(card)
    @value == card.value
  end
  
end
