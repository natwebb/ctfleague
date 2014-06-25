require 'faker'
require 'randomgaussian'

class Soldier < ActiveRecord::Base
  belongs_to :unit

  def set_starting_attributes
    self.xp = 0
    self.age = 18
    self.damage = 0
    self.rank = 1
    self.active = false
    self.first_name = Faker::Name.first_name
    self.last_name = Faker::Name.last_name
    self.aim = generate_stat
    self.stealth = generate_stat
    self.sight = generate_stat
    self.speed = generate_stat
    self.hardiness = generate_stat
    self.leadership = generate_stat
    self.save
  end

  def effective_hardiness
    truehard = self.hardiness - self.damage * 10
    if truehard < 1
      truehard = 1
    end
    truehard
  end

  private

  def generate_stat
    rg = RandomGaussian.new(50,16)
    stat = rg.norminv
    if stat > 99
      stat = 99
    elsif stat < 1
      stat = 1
    end
    stat
  end
end
