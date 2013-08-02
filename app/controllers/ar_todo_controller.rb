class ArTodoController

  def self.list(complete = nil)
    if complete.nil?
      tasks = Task.all
    else
      tasks = (complete.downcase == 'completed') ? Task.where(:completed => true) : Task.where(:completed => false)  
    end

    tasks.each do |t|
      status = t.completed ? '- Completed' : ''
      puts "#{t.id} - #{t.name} #{status}"
    end
  end

  def self.add(new_task)
    Task.create({:name => new_task, :completed => false})
  end

  def self.delete(task_id)
    # Task.delete()
  end

  def self.interface(command, parameter)
    self.send(command.to_sym, parameter)
  end
end


command = ARGV.shift
parameter = ARGV.join(' ') unless ARGV[0].nil? 

ArTodoController.interface(command, parameter)
