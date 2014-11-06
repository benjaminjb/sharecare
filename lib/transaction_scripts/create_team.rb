module Sharecare
  module UseCases
    class CreateTeam
      def self.run(params)
        team = Team.new(params)
        if team.save
          return {success?: true, team: team}
        else
          error = x.errors.messages.map { |key,val|  "#{key.to_s.capitalize} #{val}"}
          return { success?: false, error: error }
        end
      end
    end
  end
end