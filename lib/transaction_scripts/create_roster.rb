module Sharecare
  module UseCases
    class CreateRoster
      def self.run(team, id, role)
        roster = Roster.new(:team_id => team.id, :user_id => id, :role => role)
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