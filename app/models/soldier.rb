class Soldier < ActiveRecord::Base
  belongs_to :unit

  def set_starting_attributes
    self.xp = 0
    self.age = 18
    self.damage = 0
    self.rank = 1
    self.active = false
    self.first_name = "Tim" #Faker::Name.first_name
    self.last_name = "Meadows" #Faker::Name.last_name
    self.aim = generate_stat
    self.stealth = generate_stat
    self.sight = generate_stat
    self.speed = generate_stat
    self.hardiness = generate_stat
    self.leadership = generate_stat
    self.save
  end

  private

  def generate_stat
    require 'randomgaussian'
    rg = RandomGaussian.new(50,16)
    return rg.norminv
  end
end
