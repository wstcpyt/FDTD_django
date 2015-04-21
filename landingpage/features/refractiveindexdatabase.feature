Feature: Refractive Index database
  # Enter feature description here

  Scenario: Customer Come to refractive index Database page from the landing page
    Given Customer come to Landing Page without login
    When Click the database button in the menu nav
    Then see the title is DatabaseDirectory

   Scenario: Customer on refractive index database page can go back to home page
    Given Customer come to the refractive index database page
    When Click the logo button
    Then see the title is FDTD

   Scenario: Customer Check the number of the Category items
     Given Customer come to the refractive index database page
     Then Category show the right number of items

   Scenario: Customer Can Choose Category and Element
     Given Customer come to the refractive index database page
     When Choose the Category
     And interact with next button on category selection panel
     Then see the right number of element items

   Scenario: Customer Choose Element and See the Elementlist
     Given Customer come to the refractive index database page
     When Choose the Category
     And interact with next button on category selection panel
     And Choose the Element
     And interact with the next button on element selection panel
     Then see the right number of elementlist items

   Scenario: Customer Choose from Elementlist and finally get the result
     Given Customer come to the refractive index database page
     When Choose the Category
     And interact with next button on category selection panel
     And Choose the Element
     And interact with the next button on element selection panel
     And Pick a elementpage from the Elementlist
     And Interact with the done button on elementlist panel