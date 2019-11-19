class ArticlePolicy < ApplicationPolicy
  def index?
    # user.admin? or not record.published?
    # binding.pry
    # @article.user == self.user
    @articles = @article.each { |article| article.user == self.user }
    # binding.pry
    # true
  end

  def edit?
  	@article.user == self.user ? true : false
  end

  def destroy?
  	@article.user == self.user ? true : false
  end

end