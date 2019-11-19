class ArticlePolicy < ApplicationPolicy

  def edit?
  	@article.user == self.user ? true : false
  end

  def destroy?
  	@article.user == self.user ? true : false
  end

end