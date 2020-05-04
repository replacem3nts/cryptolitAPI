class ChallengesController < ApplicationController
    def create
        Challenge.generate(challenge_params)
    end

    private

    def challenge_params
        params.require(:challenge).permit(:user, :difficulty)
    end
end
