class Match < ActiveRecord::Base
  belongs_to :league
  has_many :match_members
  has_many :users, through: :match_members
  has_many :match_tokens
  has_many :tokens, through: :match_tokens

  scope :finished, -> { where(finished: true) }
  scope :active, -> { where(finished: [false, nil]) }

  def finish
    self.finished = true
    award_points
    increase_unit_stats
    self.save
  end

  private

  def award_points
    self.match_members.each do |match_member|
      if match_member.winner
        membership = self.league.memberships.find_by_user_id(match_member.user_id)
        membership.points = membership.points + 1
        membership.save
      end
    end
  end

  def increase_unit_stats
    side_1 = self.match_tokens.where(side: 1).to_a
    side_2 = self.match_tokens.where(side: 2).to_a

    side_1.map! do |match_token|
      match_token.token.units.first.soldiers.first
    end

    side_2.map! do |match_token|
      match_token.token.units.first.soldiers.first
    end

    side_1 = side_1.sort_by do |soldier|
      soldier.leadership
    end

    side_2 = side_2.sort_by do |soldier|
      soldier.leadership
    end

    leadership_1 = side_1.last.leadership
    leadership_2 = side_2.last.leadership

    side_1.each do |soldier|
      bonus = 200 * ((leadership_1 + 5000)/10000.00)
      soldier.aim = soldier.aim + bonus
      soldier.speed = soldier.speed + bonus
      soldier.stealth = soldier.stealth + bonus
      soldier.sight = soldier.sight + bonus
      soldier.hardiness = soldier.hardiness + bonus
      soldier.leadership = soldier.leadership + bonus
      #XP +1 at the end of a match where they weren't incapacitated
      #rank +1 at certain XP thresholds
      soldier.save
    end

    side_2.each do |soldier|
      bonus = 200 * ((leadership_2 + 5000)/10000.00)
      soldier.aim = soldier.aim + bonus
      soldier.speed = soldier.speed + bonus
      soldier.stealth = soldier.stealth + bonus
      soldier.sight = soldier.sight + bonus
      soldier.hardiness = soldier.hardiness + bonus
      soldier.leadership = soldier.leadership + bonus
      #XP +1 at the end of a match where they weren't incapacitated
      #rank +1 at certain XP thresholds
      soldier.save
    end
  end
end
