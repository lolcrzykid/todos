require_relative '../../config/application'

class UpdateTasks < ActiveRecord::Migration
  def change  
    add_column :tasks, :completedness, :boolean, default: false
  end  
end
