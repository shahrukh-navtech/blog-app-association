class RemoveCommentFromActor < ActiveRecord::Migration[6.0]
  def change

    remove_column :actors, :Comment, :string
  end
end
