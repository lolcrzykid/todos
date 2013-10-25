require_relative '../../config/application'

class CreateTasks < ActiveRecord::Migration
  def change  
    create_table :tasks do |t|
    
      t.text :todo_text
      t.timestamp

    end
  end  
end
