class AoeWeapon < Weapon

  def initialize
    super("Explosion", 40, 30)
    @consumable = true
    @range = 1
  end

  def hit(enemy)
    enemy.scan.each do |target|
      target.wound(30,true)
    end
  end


end