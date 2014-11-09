module Sharecare
  module UseCases
    class ModifyInvitation
      def self.run(invite_id, join, user_email, user_id)
        invitation = Invitation.find(invite_id)
        if invitation.email != user_email
          return { success?: false, invite_id: invite_id, message: "You don't have permission to modify that invitation." }
        else 
          invitation.destroy
        end

        if join == "false"
          return {success?: true, invite_id: invite_id, message: "Invitation for #{invitation.team.name} rejected."}
        elsif join == "true"
          roster = Roster.new(:team_id => invitation.team_id, :user_id => user_id)
        else
          return { success?: false, invite_id: invite_id, message: "Unspecified error." }
        end
        
        if roster && roster.save
          team = Team.includes(:users, :rosters, :invitations).find(roster.team_id)
          return {success?: true, invite_id: invite_id, team: team, message: "Invitation for #{team.name} accepted."} 
        else
          return { success?: false, invite_id: invite_id, message: "There was trouble joining the team at this time." }
        end
      end
    end
  end
end