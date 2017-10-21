class Schedule < ApplicationRecord
  belongs_to :action_plan
  has_many :schedule_customers, dependent: :destroy
  has_many :customers, through: :schedule_customers
  accepts_nested_attributes_for :customers,
                                allow_destroy: true

  validates :target, numericality: { only_integer: true }, on: :update
  validates :achievement, numericality: true, on: :update
  validates :body, presence: true, length: { maximum: 512 }

  def self.term_between(term_from, term_to)
    where("term_from >= ? and term_to < ?", term_from, term_to)
  end
end
