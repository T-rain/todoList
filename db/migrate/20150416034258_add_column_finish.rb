class AddColumnFinish < ActiveRecord::Migration
  def change
  	add_column :lists, :state, :boolean, :default => false
  end
end
