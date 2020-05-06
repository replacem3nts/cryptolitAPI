class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :solved, :solvetime
  belongs_to :puzzle
end
