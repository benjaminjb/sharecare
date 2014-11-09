class RemoveClaimsTable < ActiveRecord::Migration
  def change
    drop_table :claims
  end
end
