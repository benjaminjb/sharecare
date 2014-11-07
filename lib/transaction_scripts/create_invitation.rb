module Sharecare
  module UseCases
    class CreateInvitation
      def self.run(params)
        if params["email"].empty?
          return { success?: false, team_id: params["team_id"], error: "Email can't be blank." }

        elsif Roster.find_by_team_id_and_user_id(params["team_id"],User.find_by_email(params["email"]))
          return { success?: false, team_id: params["team_id"], error: "Already a member of that team." }

        elsif Invitation.where(:team_id => params["team_id"]).map(&:email).include?(params["email"])
          return { success?: false, team_id: params["team_id"], error: "This person has already been invited." }

        else
          invite = Invitation.new(params)
          invite.open = true
        end
          
        if invite.save
          return {success?: true, team_id: params[:team_id], invite: invite}
        else
          return { success?: false, team_id: params[:team_id], error: "Not a valid email address." }
        end

      end
    end
  end
end