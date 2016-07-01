class Weapon < Item
  attr_reader :damage, :range

  def initialize(name, weight, damage)
    super(name, weight)
    @damage = damage
    @range = 0
    @consumable = false
  end

  def hit(enemy)
    enemy.wound(damage)
  end
end