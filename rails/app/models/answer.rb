class Answer < Struct.new(:value)
  include Comparable

  def <=>(other)
    to_a <=> other.to_a
  end

  def to_a
    to_s.downcase.split
  end

  def to_s
    if number? then value.to_i.to_words else value end
  end

  def number?
    value[/\d+/] == value
  end
end
