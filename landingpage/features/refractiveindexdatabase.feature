Feature: Refractive Index database
  # Enter feature description here

  Scenario: Customer on index app page can search element and get RFIndex Chart
    Given Customer on index app page
    When search an element
    And see the element list
    And click the first elementlist
    Then see the google chart svg
    Then see the exportdata button