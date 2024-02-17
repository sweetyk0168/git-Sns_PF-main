class RemoveEventRepoIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :event_repo_id, :integer
  end
end
