class Page < ApplicationRecord
  before_validation :generate_permalink

  private

  def generate_permalink
    self.permalink = permalink.parameterize
  end
end
