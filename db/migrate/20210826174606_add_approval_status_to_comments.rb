class AddApprovalStatusToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :is_approved, :boolean
  end
end
