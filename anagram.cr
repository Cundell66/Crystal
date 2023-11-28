module Anagram
  def self.sort(word : String) : String
    word.chars.sort!.join
  end

  def self.find(subject : String, candidates : Array(String)) : Array(String)
    sorted_subject = sort(subject.downcase)

    candidates.select do |s|
      sorted_subject == sort(s.downcase) && subject.downcase != s.downcase
    end
  end
end
