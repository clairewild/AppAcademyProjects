require "set"

class WordChainer
  attr_reader :all_seen_words

  def initialize
    @dictionary = File.readlines("dictionary.txt").map(&:chomp).to_set
    @current_words = nil
    @all_seen_words = {}
  end

  def adjacent_words(word)
    abc = ("a".."z").to_a
    res = []
    (0...word.length).each do |i|
      abc.each do |letter|
        temp_word = word[0...i] + letter + word[i+1..-1]
        if @dictionary.include?(temp_word) && temp_word != word
          res << temp_word
        end
      end
    end
    res
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }
    until @current_words.empty?
      @current_words = get_neighbors
    end
    puts "Answer is"
    puts build_path(target)
  end

  def build_path(target)
    path = [target]
    until @all_seen_words[target].nil?
      path.unshift(@all_seen_words[target])
      target = path.first
    end
    path
  end

  def get_neighbors
    new_current_words = []
    @current_words.each do |word|
      temp_words = adjacent_words(word)
      temp_words.each do |neighbor|
        bad_word = invalid?(neighbor, new_current_words)
        unless bad_word
          new_current_words << neighbor
          @all_seen_words[neighbor] = word
        end
      end
    end
    new_current_words.each do |w|
      puts "#{w} came from #{@all_seen_words[w]}"
    end
    new_current_words
  end

  def invalid?(word, arr)
    arr.include?(word) || @all_seen_words.include?(word)
  end

end

w = WordChainer.new
w.run("duck", "ruby")
#w.run("masked", "market")
# p w.adjacent_words("duck")
# p w.all_seen_words["duck"]
# p w.all_seen_words["ruby"]
