module Sharecare
  module UseCases
    class ModifyTask
      def self.run(task_id, change, user_id, time_zone)

        task = Task.includes(:team).find(task_id)

        if !task
          return { success?: false, task_id: task_id, message: "There was a problem retrieving that task. Please try again." }
        elsif Roster.find_by_team_id_and_user_id(task.team.id, user_id).nil?
          return { success?: false, task_id: task.id, message: "You don't have permission to #{change} that task." }
        end
        
        task.user_id = user_id
        
        case change
        when "completed"
          task.completed = true
          task.completed_at = DateTime.now.in_time_zone(time_zone)
        end

        task.save
        return {success?: true, task_id: task.id, task: task, change: change, message: "Task #{change}."}
        
      end
    end
  end
end


