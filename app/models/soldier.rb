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

  def age_up
    self.age = self.age + 1
    self.save
  end

  def check_for_retirement
    if self.age == 30
      self.retired = true
      self.save

      self.unit.token.on_squad = false
      self.unit.token.save
    end
  end

  private

  def generate_stat
    rg = RandomGaussian.new(50,16)
    stat = rg.norminv
    stat = stat * 100
    if stat > 9900
      stat = 9900
    elsif stat < 100
      stat = 100
    end
    stat
  end
end
