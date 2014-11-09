module Sharecare
  module UseCases
    class ShowTeam
      def self.run(team_id, user)
        team = Team.includes(:tasks, :users).find(team_id)        
        if !(team.users.include?(user))
          return { success?: false, :access => false, message: "You don't have access to that team."}
        end

        claimed_tasks = team.tasks.select {|task| task.user_id == user.id && !task.completed}
        overdue_tasks = team.tasks.select {|task| task.endtime < Time.now && !task.completed} 
        active_tasks = team.tasks.select {|task| !task.completed } - (claimed_tasks + overdue_tasks)
        completed_tasks = team.tasks.select {|task| task.completed}

        return { success?: true, 
          team: team,
          claimed_tasks: claimed_tasks, 
          overdue_tasks: overdue_tasks, 
          active_tasks: active_tasks, 
          completed_tasks: completed_tasks, 
          message: "Welcome to the team page for #{team.name}" }
      end
    end
  end
end