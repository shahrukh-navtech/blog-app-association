class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def edit?
  	@article.user == self.user ? true : false
  end

  def destroy?
  	@article.user == self.user ? true : false
  end

end