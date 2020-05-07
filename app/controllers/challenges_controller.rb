class ChallengesController < ApplicationController
    def create
        fkeys = Randomizer.get_user_puzzle(challenge_params)
        @challenge = Challenge.create(fkeys)
        if @challenge.valid?
            render json: @challenge
        else
            render json: {message: "Sorry, you've completed all the puzzles of that difficulty!"}
        end
    end

    def solved
        @challenge = get_challenge 
        if Cipher.unhex(@challenge.solvekey) == params[:key]
            @challenge.update(solve_challenge_params)
            render json: @challenge
        else
            render json: {solved: false}
        end
    end

    private

    def get_challenge
        Challenge.find(params[:id])
    end

    def challenge_params
        params.permit(:difficulty, :user)
    end
end
