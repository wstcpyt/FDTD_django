Feature: Guide Page
  # Enter feature description here

  Scenario: Customer can go back to refractive index landing page from guide page
    Given Customer come to guide page
    When Click the gotoindexlandingpage button
    Then see the title is DatabaseDirectory