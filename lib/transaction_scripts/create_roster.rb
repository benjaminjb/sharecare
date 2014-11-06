module Sharecare
  module UseCases
    class CreateRoster
      def self.run(team)
        roster = Roster.new(:team_id => team.id, :user_id => current_user.id)
        if roster.save
          return {success?: true}
        else
          error = x.errors.messages.map do |key,val| 
            "#{key.to_s.capitalize} #{val}"
          end
          return { success?: false, error: error }
        end
      end
    end
  end
end