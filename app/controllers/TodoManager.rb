require_relative '../../config/application'


class TodoManager

  def run!
    user_choice
    compare_input
  end
 
  def user_choice
    @user_input = ARGV
  end
  
  def compare_input
    case @user_input.shift
      when "add"
        add
      when "delete"
        delete
      when "list"
        list
      when "complete"
        complete
    end
  end

  def add
    Task.create(todo_text: @user_input.join(" "))#, completedness: false)
  end

  def delete
    id = @user_input.join.to_i
    Task.destroy(id)
  rescue ActiveRecord::RecordNotFound => e
    puts "That task id does not exist"
  end

  def list
    Task.all.each do |task| 
      puts "#{task.id}: #{task.todo_text} complete: #{task.completedness}"
    end
  end

  def complete
    id = @user_input.join.to_i
    task = Task.find(id)
    task.completedness = true
    task.save
  end

end

TodoManager.new.run!
