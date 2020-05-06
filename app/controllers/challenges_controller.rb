class ChallengesController < ApplicationController
    def create
        @challenge = Challenge.make_new(challenge_params)
        if @challenge
            render json: @challenge
        else
            render json: {message: "Sorry, you've completed all the puzzles of that difficulty!"}
        end
    end

    private

    def challenge_params
        params.permit(:difficulty, :user)
    end
end
