class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content,length: { minimum: 250 }
  validates :summary,length: { maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :post_title

  def post_title
    if !self.title.nil?
      phrases = ["Won't Believe", "Secret", "Top[number]", "Guess"]
      if !phrases.any? {|phrase| self.title.include?(phrase)}
        errors.add(:title, "Not clickbaity enough :)")
      end
    else
      errors.add(:title, "Not clickbaity enough :)")
    end
  end

end
