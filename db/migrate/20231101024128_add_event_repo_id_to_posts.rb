class AddEventRepoIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :event_repo_id, :integer
  end
end
