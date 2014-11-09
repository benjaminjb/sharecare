module Sharecare
  module UseCases
    class LeaveTeam
      def self.run(params, user_id)
        roster = Roster.find(params[:id])
        if roster.nil?
          return { success?: false, team_id: roster.team_id, message: "There was an error leaving this team. No roster found." }
        elsif roster.user_id != user_id
          return { success?: false, team_id: roster.team_id,message: "There was an error leaving this team. This is not your roster." }
        end

        other_members = Roster.where(:team_id => roster.team_id)

        if other_members && roster.role != "primary"
          roster.destroy
          return {success?: true, team_id: roster.team_id,message: "You left the team successfully."}
        elsif other_members && roster.role == "primary"
          next_earliest_member = Roster.find_by(:team_id => roster.team_id)
          next_earliest_member.role = "primary"
          next_earliest_member.save
          roster.destroy
          return {success?: true, team_id: roster.team_id,message: "You left the team successfully (and passed the role of primary on)."}
        elsif other_members.nil?
          return {success?: false, team_id: roster.team_id, message: "You are the only member of this team. Please press delete if you wish to delete the team."}
        end
      end
    end
  end
end