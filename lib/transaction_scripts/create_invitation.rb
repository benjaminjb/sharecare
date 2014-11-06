module Sharecare
  module UseCases
    class CreateInvitation
      def self.run(params)
        invite = Invitation.new(params)
        invite.open = true
        # if Roster.find_by_team_id_and_user_id(invite.team_id, current_user.id)
        #   return { success?: false, error: "You don't belong to that team. How did you get to this page?" }
        # end
        if Invitation.where(:team_id => invite.team_id).map(&:email).include?(invite.email)
          return { success?: false, error: "This person has already been invited." }
        end 
        if invite.save
          return {success?: true, invite: invite}
        else
          return { success?: false }
        end
      end
    end
  end
end
