class AddOpenToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :open, :boolean
  end
end
