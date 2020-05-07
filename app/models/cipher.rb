require 'digest'
class Cipher

    def self.level_one_crypto(text)
        text_array = text.upcase.split("")
        rotation = rand(3..23)
        rot(rotation, text_array)
    end

    def self.level_one_key(text)
        lowercase_words = text.upcase.scan(/[A-Z]+/)
        unique_chars = lowercase_words.join.split("").uniq.join
        key = Digest::SHA256.hexdigest unique_chars
    end

    def self.rot(rotation, char_array)
        alphabet = ("A".."Z").to_a
        cipher_hash = Hash[alphabet.zip(alphabet.rotate(rotation))]
        char_array.map {|char| char.match(/[A-Z]+/) ? cipher_hash[char] : char}.join
    end
end