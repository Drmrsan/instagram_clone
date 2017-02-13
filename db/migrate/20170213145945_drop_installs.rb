class DropInstalls < ActiveRecord::Migration[5.0]
  def up
  	drop_table :installs
  end
end
