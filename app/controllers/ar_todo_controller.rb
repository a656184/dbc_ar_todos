class ArTodoController

  def self.list(complete = nil)
    if complete.nil?
      tasks = Task.all
    else
      tasks = (complete.downcase == 'completed') ? Task.where(:completed => true) : Task.where(:completed => false)  
    end

    tasks.each do |t|
      print_task(t)
    end
  end

  def self.add(new_task)
    Task.create({:name => new_task, :completed => false})
  end

  def self.delete(task_id)
    task_to_delete = Task.find(task_id)
    task_to_delete.delete
  end

  def self.complete(task_id)
    task_to_complete = Task.find(task_id)
    task_to_complete.completed = true
    task_to_complete.save
    print_task(task_to_complete)
  end

  def self.incomplete(task_id)
    task_to_incomplete = Task.find(task_id)
    task_to_incomplete.completed = false
    task_to_incomplete.save
    print_task(task_to_incomplete)
  end
   
  def self.interface(command, parameter)
    self.send(command.to_sym, parameter)
  end

  private

  def self.print_task(task)
    status = task.completed ? '- Completed' : ''
    puts "#{task.id} - #{task.name} #{status}"
  end

end


command = ARGV.shift
parameter = ARGV.join(' ') unless ARGV[0].nil? 

ArTodoController.interface(command, parameter)
