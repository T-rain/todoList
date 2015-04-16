class FixStatetype < ActiveRecord::Migration
  def change
  	remove_column :lists, :state
  	add_column :lists, :dostate, :string, :default => "NO"
  end
end
