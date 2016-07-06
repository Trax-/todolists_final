class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: { in: %w(male female)}
  validate :first_or_last_null_not_both
  validate :gender_male_not_sue

  def first_or_last_null_not_both
    if first_name === nil && last_name === nil
      errors.add(:first_name, 'Must define a first name or a last name')
    end
  end

  def gender_male_not_sue
    if gender == 'male' && first_name == 'Sue'
      errors.add(:first_name, 'Cannot have a male named Sue')
    end
  end

  def self.get_all_profiles(min, max)
    self.where('birth_year BETWEEN :min_year AND :max_year', min_year: min, max_year: max).order(birth_year: :asc)
  end
end
