*** Settings ***
Library    lib.py

*** Test Cases ***
Rick_Morty_All_Characters
      [documentation]    /// Является ли количество всех
      ...  персонажей эквивалентным заявленному в документации ///
      ${characters}=    get_all_rm_characters
      Should be equal    ${characters}    ${826}

