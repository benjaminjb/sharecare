module Sharecare
  module UseCases
    class CreateTask
      def self.run(params)
        task = Task.new(params, completed: false)
        if task.task.nil?
          return { success?: false, message: "Task cannot be left blank." }
        elsif task.save
          return {success?: true, task: task, message: "Task successfully created."}
        else
          error = task.errors.messages.map { |key,val| "#{key.to_s} #{val[0]}"}[0]
          return { success?: false, message: error }
        end
      end
    end
  end
end