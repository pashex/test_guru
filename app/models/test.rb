class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  belongs_to :category

  def self.titles_by_category(title)
    joins(:category).where(categories: { title: title })
      .order(title: :desc).pluck(:title)
  end
end
