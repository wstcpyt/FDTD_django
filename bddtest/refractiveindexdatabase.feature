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

   Scenario: Customer Can Choose Category
     Given Customer come to the refractive index database page
     When Choose the Category
     Then can interact with next button on category selection panel