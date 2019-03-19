module UsersHelper
  def liked?(likeable)
    self.likes.find_by(likeable: likeable).nil?
  end
end
