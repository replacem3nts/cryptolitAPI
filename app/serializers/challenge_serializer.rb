class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :cryptogram, :solved, :solvetime
  belongs_to :puzzle
end
