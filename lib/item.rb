class Item
  attr_reader :name, :weight, :consumable

  def initialize(name, weight)
    @name = name
    @weight = weight
    @consumable = true
  end

end