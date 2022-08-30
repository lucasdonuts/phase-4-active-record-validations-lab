class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_is_clickbait

  def title_is_clickbait
    bait_phrases = ["Won't Believe", "Secret", "Top ", "Guess"]

    unless !title || bait_phrases.any? { |phrase| title.include? phrase }
      errors.add( :title, "Title not clickbait-y enough.")
    end

  end
end
