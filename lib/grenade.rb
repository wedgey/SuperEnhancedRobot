class Grenade < Weapon
  attr_reader :range

  def initialize
    super("Grenade", 40, 15)
    @consumable = true
    @range = 2
  end

end
