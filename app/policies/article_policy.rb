class ArticlePolicy < ApplicationPolicy
  def index?
    # user.admin? or not record.published?
    # article.user == self.current_user
    true
  end

  def edit?
  	@article.user == self.user ? true : false
  end

  def destroy?
  	@article.user == self.user ? true : false
  end

end