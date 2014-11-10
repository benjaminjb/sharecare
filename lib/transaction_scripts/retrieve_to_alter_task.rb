module Sharecare
  module UseCases
    class RetrieveToAlterTask
      def self.run(task_id, user_id)
        
        task = Task.includes(:team).find(task_id)

        if !task
          return { success?: false, task_id: task_id, message: "There was a problem retrieving that task. Please try again." }
        
        elsif Roster.find_by_team_id_and_user_id(task.team.id, user_id).nil?
          return { success?: false, task_id: task.id, message: "You don't have permission to edit that task." }
        
        else
          return {success?: true, task_id: task.id, task: task, message: "Edit task."}
        end

      end
    end
  end
end