module Sharecare
  module UseCases
    class AcceptInvitation
      def self.run(invite_id, user_email, user_id)
        invitation = Invitation.find(invite_id)
        if invitation.email == user_email
          roster = Roster.new(:team_id => invitation.team_id, :user_id => user_id)
        else
          return { success?: false, invite_id: invite_id, message: "You don't have permission to accept that invitation." }
        end
        
        if roster.save
          invitation.destroy
          team = Team.includes(:users, :rosters, :invitations).find(roster.team_id)
          return {success?: true, invite_id: invite_id, team: team, message: "Invitation for #{team.name} accepted."} 
        else
          return { success?: false, invite_id: invite_id, message: "There was trouble accepting that invitation at this time." }
        end
      end
    end
  end
end