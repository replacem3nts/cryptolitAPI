class ChallengesController < ApplicationController
    def create
        fkeys = Randomizer.get_user_puzzle(challenge_params[:difficulty], challenge_params[:user_id] )
        @challenge = Challenge.create(fkeys)
        if @challenge.valid?
            render json: @challenge
        else
            render json: {message: "Sorry, you've completed all the puzzles of that difficulty!"}
        end
    end

    def solved
        @challenge = get_challenge
        if @challenge.solvekey == Cipher.level_one_key(params[:key])
            @challenge.update(solve_challenge_params) if !@challenge.solved 
            render json: @challenge
        else
            render json: {solved: false}
        end
    end

    private

    def get_challenge
        Challenge.find(params[:id])
    end

    def solve_challenge_params
        params.permit(:solved, :solvetime)
    end

    def challenge_params
        params.permit(:difficulty, :user_id)
    end
end
