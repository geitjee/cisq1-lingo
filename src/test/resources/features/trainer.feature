Feature: Guess word on Lingo
  As a player,
  I want to guess the word within 5 tries,
  In order to get points and to start a new round

  Scenario Outline: Start a new round
    Given i am playing a game
    And the round was won
    And the last word had "<previous length>" letters
    When I start a new round
    Then the word to guess has "<next length>" letters

    Examples:
      | previous length | next length |
      | 5               | 6           |
      | 6               | 7           |
      | 7               | 5           |

    # Failure path
    Given I am playing a game
    And the round was lost
    Then I cannot start a new round

    Scenario Outline: Guessing a word
      Given i am playing a game
      And I can still guess
      And it isn't the last guess
      When "<guess>" is not equal to the "<word>"
      Then I get "<feedback>"
      And I can try again

      Given i am playing a game
      And it is my last guess
      When When "<guess>" is not equal to the "<word>"
      Then I get "<feedback>"
      And the game stops

      Given i am playing a game
      And I can still guess
      When "<guess>" is equal to the "<word>"
      Then I get "<feedback>"
      And I get points
      And I can start a new game


      Examples:
        | word    | guess   | feedback |
        | banaan  | puzzel  | p: is not in word, u: is not in word, z: is not in word, z: is not in word, e: is not in word, l: is not in word |
        | raadsel | daadels | d: is not in word, a: correct, a: correct, d: correct, e: is in word, l: is in word, s: is in word |
