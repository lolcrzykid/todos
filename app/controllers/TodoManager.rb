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
    end
  end

  def add
    Task.create(todo_text: @user_input.join(" "))
  end

  def delete
    id = @user_input.join.to_i
    # if Task.exists?(id)
      Task.destroy(id)
    # else
    #   raise "That task id does not exist"
    # end
  rescue ActiveRecord::RecordNotFound => e
    puts "exception rescued"
    p e.message  
  end

  def list
    Task.all.each do |task| 
      puts "#{task.id}: #{task.todo_text}"
    end
  end

end

TodoManager.new.run!
