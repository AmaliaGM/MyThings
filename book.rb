require 'json'

class Book < Item
  attr_accessor :label, :author

  def initialize(label, author)
    @label = label
    @author = author
    @books = []
  end
end
