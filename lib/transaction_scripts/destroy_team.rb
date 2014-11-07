module Sharecare
  module UseCases
    class DestroyTeam
      def self.run(team_id, user_id)
        roster = Roster.find_by_team_id_and_user_id_and_role(team_id, user_id, "primary")
        if roster
          Team.find(team_id).destroy
          return {success?: true, message: "Team destroyed successfully."}
        else
          return { success?: false, message: "You don't have permission to destroy that team." }
        end
      end
    end
  end
end