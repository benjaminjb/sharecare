module Sharecare
  module UseCases
    class RejectInvitation
      def self.run(invite_id, user_email)
        invitation = Invitation.includes(:team).find(invite_id)
        if invitation.email == user_email 
          invitation.open = false
          invitation.save
          return {success?: true, invite_id: invite_id, message: "Invitation for #{invitation.team.name} rejected."} 
        else
          return { success?: false, invite_id: invite_id, message: "You don't have permission to reject that invitation." }
        end
      end
    end
  end
end