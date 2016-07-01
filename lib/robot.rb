class Robot
  MAX_WEIGHT = 250
  MAX_HEALTH = 100
  MAX_SHIELD = 50
  @@list = []
  attr_reader :position, :items, :health, :shield
  attr_accessor :equipped_weapon

  def initialize
    @position = [0,0]
    @items = []
    @health = MAX_HEALTH
    @shield = MAX_SHIELD
    @@list << self
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(item)
    items_weight + item.weight > MAX_WEIGHT ? (return false) : items << item # Should the weapon be in inventory if it is equipped?
    self.equipped_weapon = item if item.is_a? Weapon
    items.delete_at(items.find_index(item)) if item.is_a? Weapon # I guess it shouldn't be in inventory
    if health <= 80 and items.delete_at(items.find_index{ |obj| obj.is_a? BoxOfBolts })
      item.feed(self)
    end

    true
  end

  def items_weight
    @items.inject(0) { |sum, item| sum + item.weight }
  end

  def wound(amount, weap_pen = false)
    if weap_pen
      return health >= amount ? @health -= amount : @health = 0
    end
      
    if shield - amount < 0
      health_damage = (shield - amount).abs
      @shield = 0
    else
      @shield -= amount
      health_damage = 0
    end

    health >= health_damage ? (@health -= health_damage) : @health = 0
  end

  def heal(amount)
    health + amount < MAX_HEALTH ? @health += amount : @health = 100
  end

  def heal!(amount)
    raise RobotAlreadyDeadError if health == 0
    heal(amount)
  end

  def recharge_shield(amount)
    @shield = shield + amount > MAX_SHIELD ? 50 : shield + amount
  end

  def attack(enemy)
    range = equipped_weapon.nil? ? 1 : equipped_weapon.range
    return false if (enemy.position[1] - position[1]).abs > range or (enemy.position[0] - position[0]).abs > range
    equipped_weapon.nil? ? (return enemy.wound(5)) : equipped_weapon.hit(enemy)

    self.equipped_weapon = equipped_weapon.consumable ? nil : equipped_weapon
  end

  def attack!(enemy)
    raise UnattackableEnemy unless enemy.is_a? Robot
    attack(enemy)
  end

  def scan
    nearby = []
    (-1..1).each do |n|
      (-1..1).each do |k|
        nearby += Robot.in_position(position[0]+n, position[1]+k)
      end
    end
    nearby
  end

  class << self
    def list
      @@list
    end

    def in_position(x,y)
      list.find_all { |robot| robot.position == [x,y] }
    end
  end

end

class RobotAlreadyDeadError < StandardError
  "You cannot revive a dead robot!"
end

class UnattackableEnemy < StandardError
  "You cannot attack anyone else but another robot!"
end
