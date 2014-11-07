module Sharecare
  module UseCases
    class CreateTeam
      def self.run(params)
        team = Team.new(params)
        if team.save
          return {success?: true, team: team}
        else
          error = team.errors.messages.map { |key,val| "#{key.to_s.capitalize} #{val[0]}"}[0]
          return { success?: false, error: error }
        end
      end
    end
  end
end