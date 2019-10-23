class RemoveCommentFromMovie < ActiveRecord::Migration[6.0]
  def change

    remove_column :movies, :Comment, :string
  end
end
