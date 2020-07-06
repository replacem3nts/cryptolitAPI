# 🗝📖   CryptoLit   📖🗝
***
CryptoLit is full-stack web application that challenges you to solve cryptograms of varying difficulties based on famous lines from English Literature. The application comes out of the box with 100 puzzles with three levels of difficulty, but can be customized to make crytograms from whatever text you like!

This repository is for the backend and is designed to be used in tandem with the frontend. 


## Table of contents
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Domain Model](#domain-model)
- [Solution Checking](#solution-checking)
- [Languages and Tools](#languages-and-tools)
- [License](#license)

## Getting Started 🚀
These instructions will give you a step-by-step guide to get a copy of this project on your local machine to test, develop, or just solve puzzles. If you'd like to skip all that and just want to solve puzzles, a version of the web application is currently deployed [here]().

### Prerequisites 📋

```
ruby@v2.6.1 or higher
rails@6.0.2 or higher
git@2.17.1 or higher
gatsby-cli@2.8.22 or higher
```
### Installation 📋
NOTE: Once you've installed the backend, you'll then need to install and run the frontend to use the web application. Once you've completed the below, follow the instructions on the frontend README which you can find [here](https://github.com/replacem3nts/cryptolit).

1. Clone this repository and navigate into the folder:
```
$ git clone git@github.com:your_username/cryptolit.git
$ cd cryptolit
```

2. Open the index file:
```
$ open index.html
```

## Domain Model 🗺
<h2 align="center">
    <img src="https://github.com/replacem3nts/cryptolitAPI/blob/master/public/domain_model.png" alt="CryptoLit Domain Model" width="600px">
    <br>
<h2>

## Solution Checking ✔︎
What follows is an overview of the process that happens when a user opens a new puzzle and later wants to check an answer:
1. The user selects a difficulty level and clicks 'Get a New Puzzle' which sends the user_id and difficulty level to the backend.
2. The challenges controller calls on the 'Randomizer' PORO which chooses a random puzzle_id that the user has not created a challenge from and creates a challenge.
3. The challenge model has a 'before_create' action that calls on the 'Cipher' PORO to encrypt the text of the puzzle (based on difficulty level) and create an encrypted solvekey. The cryptogram is then rendered using the challenge serializer.
4. The cryptogram is created by either rotation or reshuffling the aphabet to build a substitution cipher then render an encoded version of the text.
5. The solvekey is created by stripping characters and duplicate letters from the crypotgram, then encyrpting that string by running it through Digest::SHA256.
6. This manner of creating a solvekey means that in the frontend, the same process of stripping characters and duplicate letters can be used to send a short string to the backend. That string can then be run through the same Digest::SHA256 module and compared with the solvekey; if the two match, the solved field is flipped to true--which unlocks a custom method from the puzzle model allowing the solution to be exposed to the user, if the two don't match, an error message is returned to the front end.

Below for a diagrammatic representation of the process:
<h2 align="center">
    <img src="https://github.com/replacem3nts/cryptolitAPI/blob/master/public/solve_flow.png" alt="CryptoLit Solution Flow" width="600px">
    <br>
<h2>

## Languages and Tools 🛠️
### Frontend:
- [Plain Vanilla Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- [Custom CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)
### Backend:
- [Ruby](https://www.ruby-lang.org/) - Primary backend API language 
- [Ruby on Rails](https://rubyonrails.org/) - Backend API MVC framework
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Active Record](https://guides.rubyonrails.org/active_record_basics.html) - Object Relational Mapping
- [Active Model Serializers](https://github.com/rails-api/active_model_serializers) - Serializer for structuring exposed API data 
- [Ruby Digest](https://ruby-doc.org/stdlib-2.4.0/libdoc/digest/rdoc/Digest.html) - Module for encrypting and decrypting data used for puzzle solutions and validations

## License
[MIT](https://choosealicense.com/licenses/mit/)